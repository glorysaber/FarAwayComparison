//
//  WeatherViewTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/24/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class WeatherViewTests: XCTestCase {

	var vc: UIViewController?

	func test_viewsWereBinded() {
		let sut = makeSUT()

		XCTAssertNotNil(sut.weatherDescriptionLabel)
		XCTAssertNotNil(sut.weatherBreifImage)
		XCTAssertNotNil(sut.verticalWeatherInfo)
		XCTAssertNotNil(sut.horizontalWeatherInfo)
		XCTAssertNotNil(sut.temperatureView)
		XCTAssertNotNil(sut.uvIndexView)
		XCTAssertNotNil(sut.cloudCoverageView)
		XCTAssertNotNil(sut.visibilityView)
		XCTAssertNotNil(sut.rainChance)
		XCTAssertNotNil(sut.cloudSnow)
		XCTAssertNotNil(sut.sunriseOrSetTime)
	}


	func makeSUT() -> WeatherBinderView {
		vc = WeatherViewController.instantiate()

		guard let viewSUT = vc?.view as? WeatherBinderView else {
			fatalError("View was not of expected type or did not exist")
		}

		return viewSUT
	}

}
