//
//  TermsPresenterTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class TermsPresenterTests: XCTestCase {

	func test_presenterCanPresent() {
		let (spy, sut) = makeSUT()
		var terms = "Test"

		XCTAssertEqual(spy.presentCalls, 0)

		sut.didFetch(terms)
		XCTAssertEqual(spy.presentCalls, 1)
		XCTAssertEqual(spy.presentedText, terms)

		terms += "2"
		sut.didFetch(terms)
		XCTAssertEqual(spy.presentCalls, 2)
		XCTAssertEqual(spy.presentedText, terms)
	}
}

// MARK: - Helpers

private extension TermsPresenterTests {
	func makeSUT() -> (spy: TermsPresenterOutputSpy, sut: TermsPresenter)  {
		let spy = TermsPresenterOutputSpy()
		let sut = TermsPresenter(output: spy)
		return (spy, sut)
	}
}

private class TermsPresenterOutputSpy: TermsPresenterOutput {
	var presentCalls = 0
	var presentedText = ""

	func present(terms: String) {
		presentCalls += 1
		presentedText = terms
	}
}
