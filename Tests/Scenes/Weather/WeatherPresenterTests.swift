//
//  WeatherPresenterTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class WeatherPresenterTests: XCTestCase {

	func test() {
		let (sut, spy) = makeSUT()

		sut.didGetUpdatedWeatherInfo(model: makeWeatherViewModel())

		XCTAssertEqual(spy.displayCalls, 1)
	}

}

private extension WeatherPresenterTests {
	class WeatherViewSpy: WeatherView {
		var displayCalls = 0

		func display(weatherInfo: WeatherViewModel) {
			displayCalls += 1
		}
	}

	func makeSUT() -> (WeatherPresenter, WeatherViewSpy) {
		let spy = WeatherViewSpy()
		let sut = WeatherPresenter(view: spy)
		return (sut, spy)
	}

	func makeWeatherViewModel() -> WeatherViewModel {
		WeatherViewModel(
			description: "Looking Cloudy",
			imageBriefName: "cloud.fill",
			temperature: "75°F",
			uvIndex: "7",
			cloudCoveragePercentage: "73",
			visibility: "4km",
			precipitation: "0",
			snowfall: "0",
			sunriseOrSet: "0")
	}
}
