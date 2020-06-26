//
//  PlanetInfoViewControllerTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/24/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PlanetInfoViewControllerTests: XCTestCase {

	func test_viewsNotNil() {
		XCTAssertNotNil(makeSUT().view)
		XCTAssertNotNil(makeSUT().mainView)
	}

	func test_viewsEqual() {
		let sut = makeSUT()

		XCTAssertEqual(sut.mainView, sut.view)
	}

	func test_viewDoesShow_population() {
		let sut = makeSUT()
		let model = makePlanetInfoModel()

		sut.show(viewModel: model)

		XCTAssertEqual(model.population, sut.mainView.populationStack.text)
		XCTAssertEqual(model.planetEarthGComparison, sut.mainView.planetContainerView.earthGravityUnitsLabel.text)
		XCTAssertEqual(model.planetDiameter, sut.mainView.planetContainerView.diameterLabel.text)
		XCTAssertEqual(model.description, sut.mainView.comparisonLabel.text)
		XCTAssertEqual(model.terrainType, sut.mainView.terrainView.text)
		XCTAssertEqual(model.earthYearEquivalence, sut.mainView.earthYearEquivalenceStack.text)
		XCTAssertEqual(model.earthDayEquivalence, sut.mainView.earthDayEquivalenceStack.text)
		XCTAssertEqual(model.waterCoverage, sut.mainView.waterCoverageStack.text)
		XCTAssertEqual(model.atmosphereType, sut.mainView.atmosphereStack.text)
	}

	func makeSUT() -> PlanetInfoViewController {
		let sut = PlanetInfoViewController.instantiate()
		_ = sut.view
		return sut
	}

	func makePlanetInfoModel() -> PlanetInfoViewModel {
		PlanetInfoViewModel(
			population: "11K",
			planetEarthGComparison: "1.3G",
			planetDiameter: "20km",
			description: "Just Like Tatoinee",
			terrainType: "Desert",
			earthYearEquivalence: "340 days",
			earthDayEquivalence: "27",
			waterCoverage: "3%",
			atmosphereType: "Arid")
	}
}
