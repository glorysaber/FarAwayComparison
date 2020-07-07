//
//  WeatherViewControllerTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/24/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class WeatherViewControllerTests: XCTestCase {

	func test_viewsNotNil() {
		XCTAssertNotNil(makeSUT().view)
		XCTAssertNotNil(makeSUT().mainView)
	}

	func test_viewsEqual() {
		let sut = makeSUT()

		XCTAssertEqual(sut.mainView, sut.view)
	}

	func test_presentWeatherModel() {
		let sut = makeSUT()
		let model = makeWeatherViewModel()

		sut.display(weatherInfo: model)

		XCTAssertEqual(model.description, sut.mainView.weatherDescriptionLabel.text)
		XCTAssertEqual(UIImage(systemName: model.imageBriefName), sut.mainView.weatherBreifImage.image)
		XCTAssertEqual(model.temperature, sut.mainView.temperatureView.text)
		XCTAssertEqual(model.uvIndex, sut.mainView.uvIndexView.text)
		XCTAssertEqual(model.cloudCoveragePercentage, sut.mainView.cloudCoverageView.text)
		XCTAssertEqual(model.visibility, sut.mainView.visibilityView.text)
		XCTAssertEqual(model.precipitation, sut.mainView.rainChance.text)
		XCTAssertEqual(model.snowfall, sut.mainView.cloudSnow.text)
		XCTAssertEqual(model.sunriseOrSet, sut.mainView.sunriseOrSetTime.text)
	}

	func test_sut_doesCall_refresh_once() {
		var refreshCalls = 0

		_ = makeSUT() {
			refreshCalls += 1
		}

		XCTAssertEqual(refreshCalls, 1)
	}

	// MARK: Helpers

	func makeSUT(refreshClosure: (() -> Void)? = nil) -> WeatherViewController {
		let sut = WeatherViewController.instantiate()
		sut.requestModelRefresh = refreshClosure
		_ = sut.view
		return sut
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
