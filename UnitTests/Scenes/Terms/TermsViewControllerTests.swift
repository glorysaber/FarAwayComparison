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

	func test_show_terms() {
		let sut = makeSUT()
		let terms = "Terms Test"

		sut.show(terms: terms)

		XCTAssertEqual(terms, sut.termsTextView.text)
	}

	func test_VC_instatiation_performance() throws {
		self.measure {
			_ = makeSUT()
		}
	}

	func test_delegate_didAgree() {
		let sut = makeSUT()
		var didAgree = false

		let delegate = SUTDelegate() {
			didAgree = true
		}

		sut.delegate = delegate

		sut.iAgreeButtonPressed(UIButton())

		XCTAssert(didAgree)
	}

	// MARK: - Helpers

	private func makeSUT() -> TermsViewController {
		let vc = TermsViewController.instantiate()
		_ = vc.view
		return vc
	}


	private class SUTDelegate: TermsViewControllerDelegate {
		let closure: ()->Void

		func termsViewControllerDidAgree() {
			closure()
		}

		init(_ closure: @escaping ()->Void)  {
			self.closure = closure
		}
	}

}
