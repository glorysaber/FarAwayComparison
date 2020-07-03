//
//  AlamoFireTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 1/29/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
import Alamofire
import Foundation


/// Makes sure AlamoFire was included properly
class AlamoFireTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  

  /// Tests that the framework is installed and working
  func testAlamoFire() {
    let requestExpect = XCTestExpectation(description: "Dual Access 1")
    
    let dataRequest = Alamofire.request("https://httpbin.org/get").response { response in
      requestExpect.fulfill()
    }
    
    wait(for: [requestExpect], timeout: 30)
    
    XCTAssert(dataRequest.progress.isFinished == true)
  }
  
  /// Tests that json can be recieved
  func testJSONRequest() {
    let requestExpect = XCTestExpectation(description: "Dual Access 1")
    
    let dataRequest = Alamofire.request("https://httpbin.org/get").responseJSON { response in
      
      requestExpect.fulfill()
    }
    wait(for: [requestExpect], timeout: 30)
    
    XCTAssert(dataRequest.progress.isFinished == true)
  }

  
}
