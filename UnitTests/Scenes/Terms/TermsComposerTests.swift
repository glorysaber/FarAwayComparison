//
//  TermsComposerTests.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class TermsComposerTests: XCTestCase {

	weak var weakSut: TermsViewController? = nil

	override func tearDown() {
		XCTAssertNil(weakSut)
	}

	func test_noStrongReferences() {
		let sut = TermsComposer().composeTerms(activity: RoutingActivity() {})
			weakSut = sut
	}
}
