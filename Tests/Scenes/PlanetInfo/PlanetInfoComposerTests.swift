//
//  PlanetInfoComposerTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PlanetInfoComposerTests: XCTestCase {

	weak var weakSut: PlanetInfoViewController? = nil

	override func tearDown() {
		XCTAssertNil(weakSut)
	}

	func test_noStrongReferences() {
		let sut = PlanetInfoComposer().compose()
		weakSut = sut
	}

}
