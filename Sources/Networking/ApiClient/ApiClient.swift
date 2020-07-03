//
//  ApiClient.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 2/10/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation
import Alamofire


/// Gives a level of abstraction for Unit tests and dependency seperation.
class ApiClient {
  typealias HTTPHeaders = [String:String]
  typealias Parameters = [String:String]
  typealias JSON = [String:NSObject]
  
  public enum HTTPMethod: String {
    case options
    case get
    case head
    case post
    case put
    case patch
    case delete
    case trace
    case connect
    
    fileprivate func mappedToAlamoFire() -> Alamofire.HTTPMethod {
      switch (self) {
      case .options:
        return .options
      case .get:
        return .get
      case .head:
        return .head
      case .post:
        return .post
      case .put:
        return .put
      case .patch:
        return .patch
      case .delete:
        return .delete
      case .trace:
        return .trace
      case .connect:
        return .connect
      }
    }
  }
  
  static let shared = ApiClient()
  
  enum Error: Swift.Error {
    case bundleInfoNotFound(MainBundleInfo)
    case keyNotFound(key: String)
    case urlNotFound(url: String? = nil)
    case internalError(String)
    case requestFailed
    case error(Swift.Error)
    
    var localizedDescription: String {
      switch self {
      case .keyNotFound(let key):
        return "Could Not find result for key: \(key)"
      case .urlNotFound(let url):
        return "Could not connect to URL \(url as Any?)"
      case .internalError(let errorMessage):
        return "InternalError: \(errorMessage)"
      case .requestFailed:
        return "Failed API resquest"
      case .error(let error):
        return "UnMapped Error: \(error)"
      case .bundleInfoNotFound(let info):
        return "Could not find required bundle info: \(info)"
      }
    }
  }
  
  private func request(
    _ url: URL,
    method: HTTPMethod = .get,
    parameters: Parameters? = nil, headers: HTTPHeaders? = nil)
    -> DataRequest {
      return Alamofire.request(url, method: method.mappedToAlamoFire(), parameters: parameters, headers: headers)
  }
  
  func requestJSON(
    _ url: URL,
    method: HTTPMethod = .get,
    parameters: Parameters? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Swift.Result<JSON, Error>) -> ()) {
    
    request(url, method: method, parameters: parameters, headers: headers).validate().responseJSON() { response in
        switch response.result {
        case .success(let data):
          
          guard let nsJSON = data as? NSDictionary else {
            completion(.failure(Error.requestFailed))
            return
          }
          
          guard let json = nsJSON as? JSON else {
            completion(.failure(Error.internalError("Failed to convert NSDictionary to JSON")))
            return
          }
          
          completion(.success(json))
        case.failure(let error):
          completion(.failure(Error.error(error)))
          return
        }
    }
  }
}
