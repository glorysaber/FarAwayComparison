//
//  PlanetComparisonServiceTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PlanetComparisonServiceTests: XCTestCase {

	func test_doesCallCallBack() {
		var callbacks = 0

		let sut = PlanetComparisonService() { _ in
			callbacks += 1
		}

		XCTAssertEqual(callbacks, 0)

		sut.getCurrentComparison()

		XCTAssertEqual(callbacks, 1)
	}

}
