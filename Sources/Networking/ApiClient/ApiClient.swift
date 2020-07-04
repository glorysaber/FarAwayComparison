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

}
