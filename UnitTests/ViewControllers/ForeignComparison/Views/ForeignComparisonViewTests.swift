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

	var vc: UIViewController?

	func test_viewsWereBinded() {
		let sut = makeSUT()

		XCTAssertNotNil(sut.rootVerticalStackView)
		XCTAssertNotNil(sut.topHorizontalStackView)
		XCTAssertNotNil(sut.planetContainerView)
		XCTAssertNotNil(sut.verticalStackStandardInfo)
		XCTAssertNotNil(sut.comaprisonLabel)
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


	func makeSUT() -> ForeignComparisonView {
		vc = ForeignComparisonViewController.instantiate()

		guard let viewSUT = vc?.view as? ForeignComparisonView else {
			fatalError("View was not of expected type or did not exist")
		}

		return viewSUT
	}
}
