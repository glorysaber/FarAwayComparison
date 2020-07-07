//
//  MainWeatherViewContainer.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/25/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class MainWeatherViewContainerTests: XCTestCase {

	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func testExample() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
	}

	func testPerformance() throws {
		// This is an example of a performance test case.
		self.measure {
			_ = makeSUT()
		}
	}

	// Helpers

	private func makeSUT() -> MainWeatherViewContainerTests {
		return MainWeatherViewContainerTests.instantiate()
	}

}
