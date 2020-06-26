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

	func test_locationButtonPressed() {
		let sut = makeSUT()
		var delegateCalls = 0

		let delgate = SUTDelegate(){
			delegateCalls += 1
		}

		sut.delegate = delgate

		XCTAssertEqual(delegateCalls, 0)

		sut.allowLocationButtonPressed(UIButton())

		XCTAssertEqual(delegateCalls, 1)

		sut.allowLocationButtonPressed(UIButton())

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
