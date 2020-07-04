//
//  WeakRefTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/2/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class WeakRefTests: XCTestCase {

	var weakSut: WeakRef<NSObject>?
	weak var weakObject: NSObject?

	override func tearDown() {
		XCTAssertNotNil(weakSut)
		XCTAssertNil(weakObject)
	}

	func test_noStrongReferences() {
		let object = NSObject()
		let sut = WeakRef(object)
		weakSut = sut
		weakObject = object
	}

}
