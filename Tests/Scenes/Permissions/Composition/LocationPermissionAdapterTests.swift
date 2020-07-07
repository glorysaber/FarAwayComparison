//
//  LocationPermissionAdapterTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class LocationPermissionAdapterTests: XCTestCase {

	func test_adapter_doesCall_presenterDisplay_alert() {
		let (sut, spy) = makeSUT()

		sut.permissionsCallBackResult(.denied)

		assertCalls(spy, 0, 1, 0)
	}

	func test_adapter_doesNotCall_presenterDisplay() {
		let (sut, spy) = makeSUT()

		sut.permissionsCallBackResult(.unRequested)

		assertCalls(spy, 0, 0, 0)
	}

	func test_adapter_doesCall_presenterDisplay_granted() {
		let (sut, spy) = makeSUT()

		sut.permissionsCallBackResult(.allowed)

		assertCalls(spy, 0, 0, 1)
	}
}

private extension LocationPermissionAdapterTests {
	func assertCalls(_ spy: PermissionsPresenterOutputSpy, _ explanation: Int, _ alert: Int, _ granted: Int) {
		XCTAssertEqual(spy.explanationViewModelCalls, explanation)
		XCTAssertEqual(spy.alertViewModelCalls, alert)
		XCTAssertEqual(spy.grantedViewModelCalls, granted)
	}

	func makeSUT() -> (LocationPermissionAdapter, PermissionsPresenterOutputSpy) {
		let spy = PermissionsPresenterOutputSpy()
		let presenter = PermissionsPresenter(output: spy)
		let sut = LocationPermissionAdapter(adaptee: presenter)
		return (sut, spy)
	}

	class PermissionsPresenterOutputSpy: PermissionsPresenterOutput {
		var explanationViewModelCalls = 0
		var alertViewModelCalls = 0
		var grantedViewModelCalls = 0


		func display(_ model: PermissionsExplanationViewModel) {
			explanationViewModelCalls += 1
		}

		func display(_ model: PermissionsAlertViewModel) {
			alertViewModelCalls += 1
		}

		func display(_ model: PermissionsGrantedViewModel) {
			grantedViewModelCalls += 1
		}


	}
}
