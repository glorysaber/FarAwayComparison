//
//  ApiTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 2/16/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class WeatherApiTests: XCTestCase {
  
  var api: ApiClient! = MockJSONRequest()
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  /// Tests getting the data and converting it to our weather data type and that all expected weather values are present
  func testWeatherAPI() {
    
    let city = "Austin", state = "TX", country = "us"
    
    let location = WeatherAPI.City(city: city, state: state, country: country);
    
    let requestExpect = XCTestExpectation(description: "request")
    
    api.requestWeather(location: location) { (response) in
      
      switch response {
      case .failure(let error):
        XCTAssert(false, error.localizedDescription)
      case .success(let data):
        // We should have all keys present. .weather need to be checked seperately
        for key in WeatherAPI.ResponseKeys.Data.allCases {
          if data[0][key] == nil {
            XCTAssert(false, "Missing Key: \(key)")
          }
        }
        
        for key in WeatherAPI.ResponseKeys.Data.Weather.allCases {
          if data[0][key] == nil {
            XCTAssert(false, "Missing Key: Weather.\(key)")
          }
        }
        
        XCTAssert((data[0][WeatherAPI.ResponseKeys.Data.cityName] as? String)?.caseInsensitiveCompare(city) == .some(.orderedSame))
        XCTAssert((data[0][WeatherAPI.ResponseKeys.Data.stateCode] as? String)?.caseInsensitiveCompare(state) == .some(.orderedSame))
        XCTAssert((data[0][WeatherAPI.ResponseKeys.Data.countryCode] as? String)?.caseInsensitiveCompare(country) == .some(.orderedSame))
      }

      requestExpect.fulfill()
    }
    
    wait(for: [requestExpect], timeout: 30)
  }
  
}
