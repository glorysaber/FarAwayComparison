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

	//  MARK: - Helpers

	private func makeSUT() -> PermissionsViewController {
		let sut = PermissionsViewController.instantiate()
		_ = sut.view
		return sut
	}

}
