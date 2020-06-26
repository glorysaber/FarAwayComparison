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
		XCTAssertNotNil(sut.explanationLabel)
	}

	func test_delegate_nil_doesNotCrash_whenButtonIsPressed() {
		makeSUT().allowLocationButtonPressed()
	}

	func test_delegate_calledOnce_whenButtonIsPressed() {
		let sut = makeSUT()
		var delegateCalls = 0

		let delgate = SUTDelegate(){
			delegateCalls += 1
		}

		sut.delegate = delgate

		XCTAssertEqual(delegateCalls, 0)

		sut.allowLocationButtonPressed()

		XCTAssertEqual(delegateCalls, 1)

		sut.allowLocationButtonPressed()

		XCTAssertEqual(delegateCalls, 2)
	}

	//  MARK: - Helpers

	private func makeSUT() -> PermissionsViewController {
		let sut = PermissionsViewController.instantiate()
		_ = sut.view
		return sut
	}

	private class SUTDelegate: PermissionsViewControllerDelegate {
		let closure: ()->Void

		init(closure: @escaping ()->Void) {
			self.closure = closure
		}

		func permissionsViewControllerPermissionsGranted() {
			closure()
		}
	}

}
