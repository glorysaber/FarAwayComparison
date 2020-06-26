//
//  ForeignComparisonViewTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/24/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class ForeignComparisonViewTests: XCTestCase {

	func test_viewsWereBinded() {
		let sut = makeSUT()

		XCTAssertNotNil(sut.rootVerticalStackView)
		XCTAssertNotNil(sut.topHorizontalStackView)
		XCTAssertNotNil(sut.planetContainerView)
		XCTAssertNotNil(sut.planetContainerView.diameterLabel)
		XCTAssertNotNil(sut.planetContainerView.earthGravityUnitsLabel)
		XCTAssertNotNil(sut.verticalStackStandardInfo)
		XCTAssertNotNil(sut.comparisonLabel)
		XCTAssertNotNil(sut.terrainView)
		XCTAssertNotNil(sut.populationStack)
		XCTAssertNotNil(sut.bottomVerticalStack)
		XCTAssertNotNil(sut.bottomHorizontalStack)
		XCTAssertNotNil(sut.earthYearEquivalenceStack)
		XCTAssertNotNil(sut.earthDayEquivalenceStack)
		XCTAssertNotNil(sut.midHorizontalStack)
		XCTAssertNotNil(sut.waterCoverageStack)
		XCTAssertNotNil(sut.atmosphereStack)
	}

	func test_bindedViewBinds() {
		let sut = makeSUT()

		XCTAssertNotNil(sut.planetContainerView.diameterLabel)
	}


	func makeSUT() -> ForeignComparisonBinderView {
		let vc = ForeignComparisonViewController.instantiate()

		guard let viewSUT = vc.view as? ForeignComparisonBinderView else {
			fatalError("View was not of expected type or did not exist")
		}

		_ = vc.view
		_ = vc.mainView.planetContainerView

		return viewSUT
	}
}
