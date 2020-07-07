//
//  FetchTermsTextUseCaseTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class FetchTermsTextUseCaseTests: XCTestCase {

	func test_fetchCallsOutput() {
		let (spy, sut) = makeSUT()

		XCTAssertEqual(spy.calls, 0)

		sut.fetch()
		XCTAssertEqual(spy.calls, 1)

		sut.fetch()
		XCTAssertEqual(spy.calls, 2)
	}

	func test_fetchOutput_IsNotEmpty() {
		let (spy, sut) = makeSUT()

		sut.fetch()
		XCTAssertEqual(spy.calls, 1)

		let index = spy.text.index(spy.text.startIndex, offsetBy: 6)
		let substring = spy.text[...index]
		XCTAssertEqual(substring, "The App")
	}

}

// MARK: - Helpers

private extension FetchTermsTextUseCaseTests {
	func makeSUT() -> (spy: FetchTermsTextUseCaseOutputSpy, sut: FetchTermsTextUseCase)  {
		let spy = FetchTermsTextUseCaseOutputSpy()
		let sut = FetchTermsTextUseCase(output: spy)
		return (spy, sut)
	}
}

private class FetchTermsTextUseCaseOutputSpy: FetchTermsTextUseCaseOutput {

	var calls = 0
	var text = ""

	func didFetch(_ terms: String) {
		calls += 1
		text = terms
	}

}
