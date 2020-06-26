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

		let delegate = SUTDelegate()

		sut.delegate = delegate

		XCTAssertEqual(delegate.didAgreeCount, 0)

		sut.iAgreeButtonPressed()
		XCTAssertEqual(delegate.didAgreeCount, 1)

		sut.iAgreeButtonPressed()
		XCTAssertEqual(delegate.didAgreeCount, 2)
	}

	func test_VC_instatiation_performance() throws {
		self.measure {
			_ = makeSUT()
		}
	}

	// MARK: - Helpers

	private func makeSUT() -> TermsViewController {
		let vc = TermsViewController.instantiate()
		_ = vc.view
		return vc
	}


	private class SUTDelegate: TermsViewControllerDelegate {
		var didAgreeCount = 0

		func termsViewControllerDidAgree() {
			didAgreeCount += 1
		}
	}

}
