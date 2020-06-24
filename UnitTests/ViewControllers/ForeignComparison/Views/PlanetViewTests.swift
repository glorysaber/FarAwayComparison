//
//  PlanetViewTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/24/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PlanetViewTests: XCTestCase {

	// Used to maintain a strong refernce to the view controller
	var vc: UIViewController?

	func test_views_notNil_afterInitilization() {
		let sut = makeSUT()

		XCTAssertNotNil(sut.diameterLabel)
		XCTAssertNotNil(sut.earthGravityUnitsLabel)
	}

	func makeSUT() -> ForeignPlanetView {
		vc = UIStoryboard(name: "PlanetView", bundle: .main).instantiateInitialViewController()

		guard let viewSUT = vc?.view as? ForeignPlanetView else {
			fatalError("View was not of expected type")
		}

		return viewSUT
	}
}
