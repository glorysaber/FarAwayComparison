//
//  MockJSONRequest.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 2/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation
@testable import FarAwayComparison

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

extension Data {
  private static let hexAlphabet = "0123456789abcdef".unicodeScalars.map { $0 }
  
  public func hexEncodedString() -> String {
    return String(self.reduce(into: "".unicodeScalars, { (result, value) in
      result.append(Data.hexAlphabet[Int(value/16)])
      result.append(Data.hexAlphabet[Int(value%16)])
    }))
  }
}

func MD5(string: String) -> Data {
  let length = Int(CC_MD5_DIGEST_LENGTH)
  let messageData = string.data(using:.utf8)!
  var digestData = Data(count: length)
  
  _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
    messageData.withUnsafeBytes { messageBytes -> UInt8 in
      if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
        let messageLength = CC_LONG(messageData.count)
        CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
      }
      return 0
    }
  }
  return digestData
}

class MockJSONRequest: ApiClient {
  
  override func requestJSON(_ url: URL, method: ApiClient.HTTPMethod = .get, parameters: ApiClient.Parameters? = nil, headers: ApiClient.HTTPHeaders? = nil, completion: @escaping (Result<ApiClient.JSON, ApiClient.Error>) -> ()) {
    let tempDirectory = FileManager.default.temporaryDirectory;
    
    // Basic hash to help prevent collisions
    let requestHashString = "\(method)\(String(describing: parameters?.sorted(by: {$0.0 > $1.0}).reduce("", {"\(String(describing: $0))\($1)"})))\(String(describing: headers?.sorted(by: {$0.0 > $1.0}).reduce("", {"\(String(describing: $0))\($1)"})))"
    
    let hash = MD5(string: requestHashString)
    
    let hashString = hash.hexEncodedString().uppercased()
    
    let mockDataURL = tempDirectory.appendingPathComponent("\(url.absoluteString.replacingOccurrences(of: "/", with: "_"))_\(hashString).json")
    
    let getAndStoreMockData = {
      super.requestJSON(url, method: method, parameters: parameters, headers: headers) { response in
        switch response {
        case .success(let data):
          
          let json = data as NSDictionary
          
          do {
            let diskJSON: NSMutableDictionary = [:]
            
            diskJSON["json"] = json
            diskJSON["method"] = method.rawValue
            diskJSON["parameters"] = parameters
            diskJSON["headers"] = headers
            
            let jsonSerial = try JSONSerialization.data(withJSONObject: diskJSON, options: .prettyPrinted)
            
            try jsonSerial.write(to: mockDataURL)
          } catch let error {
            completion(.failure(Error.error(error)))
            return
          }
          
          completion(.success(data))
        case.failure(let error):
          completion(.failure(Error.error(error)))
          return
        }
      }
    }
    
    guard let data = FileManager.default.contents(atPath: mockDataURL.path) else {
      getAndStoreMockData()
      return
    }
    
    do {
      guard let nsJSON = try JSONSerialization.jsonObject(with: data) as? NSDictionary else {
        completion(.failure(.internalError("Could not retrieve JSON")))
        return
      }
      
      guard nsJSON["method"] as? String == method.rawValue,
        nsJSON["parameters"] as? ApiClient.Parameters == parameters,
        nsJSON["headers"] as? ApiClient.HTTPHeaders == headers else {
          getAndStoreMockData()
          return
      }
      
      guard let json = nsJSON["json"] as? ApiClient.JSON else {
        completion(.failure(Error.internalError("Failed to convert NSDictionary to JSON")))
        return
      }
      
      completion(.success(json))
    } catch let error {
      completion(.failure(Error.error(error)))
      return
    }
    
    
  }
}
