//
//  PermissionsRouterTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/2/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PermissionsRouterTests: XCTestCase {

	func test_activity_finish_called() {
		var finishWasCalled = false

		let sut = PermissionsRouter(activity: RoutingActivity{
			finishWasCalled = true
		})

		sut.finish()

		XCTAssertTrue(finishWasCalled)
	}

}
