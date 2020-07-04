//
//  PermissionsPresenterTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/2/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PermissionsPresenterTests: XCTestCase {

	func test_start_doesDisplay_explanatonModel() {
		let (sut, spy) = makeSUT()

		sut.start()

		assertCalls(spy, 1, 0, 0)
	}

	func test_didGetLocationPermissions_doesCallDisplayOnOutput() {
		let (sut, spy) = makeSUT()

		sut.didGetLocationPermissions()

		assertCalls(spy, 0, 0, 1)
	}


	func test_doesNotHaveLocationPermissions_doesCallDisplayOnOutput() {
		let (sut, spy) = makeSUT()

		sut.doesNotHaveLocationPermissions()

		assertCalls(spy, 0, 1, 0)
	}

	func test_allFunctions_doesCallDisplayOnOutputMultipleTimes() {
		let (sut, spy) = makeSUT()

		sut.start()
		sut.doesNotHaveLocationPermissions()
		sut.didGetLocationPermissions()

		assertCalls(spy, 1, 1, 1)

		sut.start()
		sut.doesNotHaveLocationPermissions()

		assertCalls(spy, 2, 2, 1)
	}

}

private extension PermissionsPresenterTests {
	func assertCalls(_ spy: PermissionsPresenterOutputSpy, _ explanation: Int, _ alert: Int, _ granted: Int) {
		XCTAssertEqual(spy.explanationViewModelCalls, explanation)
		XCTAssertEqual(spy.alertViewModelCalls, alert)
		XCTAssertEqual(spy.grantedViewModelCalls, granted)
	}

	func makeSUT() -> (PermissionsPresenter, PermissionsPresenterOutputSpy) {
		let spy = PermissionsPresenterOutputSpy()
		let sut = PermissionsPresenter(output: spy)
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
