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
  
	var api = WeatherBit.ClientAPIProduction()
  
  /// Tests getting the data and converting it to our weather data type and that all expected weather values are present
  func testWeatherAPI() {
    
    let city = "Austin", state = "TX", country = "us"
    
		let location = WeatherBit.City(city: city, state: state, country: country)
    
    let requestExpect = XCTestExpectation(description: "request")

		api.requestWeather(location: location) { response in
			requestExpect.fulfill()
		}

		wait(for: [requestExpect], timeout: 30)

  }
  
}
