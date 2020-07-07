//
//  LocationPermissionsServiceMockTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/2/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class LocationPermissionsServiceMockTests: XCTestCase {

	func test_getPermissions_stateOrder() {
		var callbackStatus = PermissionsStatus.denied

		let sut = LocationPermissionsServiceMock()

		sut.onPermissionsUpdate = { status in
			callbackStatus = status
		}

		sut.currentPermissionStatus()

		XCTAssertEqual(callbackStatus, .unRequested)

		sut.getPermission()

		XCTAssertEqual(callbackStatus, .denied)

		sut.getPermission()

		XCTAssertEqual(callbackStatus, .allowed)
	}

}
