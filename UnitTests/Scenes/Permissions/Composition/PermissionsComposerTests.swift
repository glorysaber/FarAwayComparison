//
//  PermissionsComposerTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/2/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PermissionsComposerTests: XCTestCase {

	weak var weakSut: PermissionsViewController? = nil

	override func tearDown() {
		XCTAssertNil(weakSut)
	}

	func test_noStrongReferences() {
		let sut = PermissionsComposer().compose(activity: RoutingActivity() {})
		weakSut = sut
	}

}
