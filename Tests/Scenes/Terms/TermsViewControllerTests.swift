//
//  TermsViewControllerTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/25/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class TermsViewControllerTests: XCTestCase {

	func test_viewBindings_NotNil() {
		XCTAssertNotNil(makeSUT().iAgreeButton)
		XCTAssertNotNil(makeSUT().termsTextView)
	}

	func test_delegatNil_doesNotCrash() {
		makeSUT().iAgreeButtonPressed()
	}

	func test_show_terms() {
		let sut = makeSUT()
		let terms = "Terms Test"

		sut.present(terms: terms)

		XCTAssertEqual(terms, sut.termsTextView.text)
	}

	func test_delegate_didAgree() {
		let sut = makeSUT()

		var didAgreeCount = 0
		sut.userTappedOnAgree = {
			didAgreeCount += 1
		}

		XCTAssertEqual(didAgreeCount, 0)

		sut.iAgreeButtonPressed()
		XCTAssertEqual(didAgreeCount, 1)

		sut.iAgreeButtonPressed()
		XCTAssertEqual(didAgreeCount, 2)
	}

	func test_doesCall_reloadData_whenViewLoads() {
		var calls = 0
		_ = makeSUT() {
			calls += 1
		}

		XCTAssertEqual(calls, 1)
	}

}

extension TermsViewControllerTests {

	// MARK: - Helpers

	private func makeSUT(reloadData: (() -> Void)? = nil) -> TermsViewController {
		let vc = TermsViewController.instantiate()
		vc.reloadData = reloadData
		_ = vc.view
		return vc
	}

}
