//
//  PermissionsViewControllerTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PermissionsViewControllerTests: XCTestCase {

	func test_bindingsNotNil() {
		let sut = makeSUT()

		XCTAssertNotNil(sut.allowLocationButton)
		XCTAssertNotNil(sut.locationRequireExplanationLabel)
	}

	func test_delegate_nil_doesNotCrash_whenButtonIsPressed() {
		makeSUT().allowLocationButtonPressed()
	}

	func test_delegate_calledOnce_whenButtonIsPressed() {
		let sut = makeSUT()
		var delegateCalls = 0

		sut.allowPermissionsRequested = {
			delegateCalls += 1
		}

		XCTAssertEqual(delegateCalls, 0)

		sut.allowLocationButtonPressed()

		XCTAssertEqual(delegateCalls, 1)

		sut.allowLocationButtonPressed()

		XCTAssertEqual(delegateCalls, 2)
	}

	func test_doesPresentPermissiosnViewModel() {
		let sut = makeSUT()
		let model = makePermissionsViewModel()

		sut.present(explanation: model)

		XCTAssertEqual(sut.allowLocationButton.titleLabel?.text, model.locationButtonTitle)
		XCTAssertEqual(sut.locationRequireExplanationLabel.text, model.locationExplanation)
	}

	func test_doesCall_reloadData_whenViewLoads() {
		var calls = 0
		_ = makeSUT() {
			calls += 1
		}

		XCTAssertEqual(calls, 1)
	}
}

private extension PermissionsViewControllerTests {

	//  MARK: - Helpers

	private func makeSUT(reloadData: (() -> Void)? = nil) -> PermissionsViewController {
		let sut = PermissionsViewController.instantiate()
		sut.reloadData = reloadData
		_ = sut.view
		return sut
	}

	private func makePermissionsViewModel() -> PermissionsViewModel {
		return PermissionsViewModel(locationExplanation: "Just a test", locationButtonTitle: "Truly, a test")
	}

}
