//
//  MainWeatherComposerTests.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class MainWeatherComposerTests: XCTestCase {

	weak var weakSut: MainWeatherViewContainer? = nil

	override func tearDown() {
		XCTAssertNil(weakSut)
	}

	func test_noStrongReferences() {
		let sut = MainWeatherComposer().compose(appContainer: AppContainer())
		weakSut = sut
	}

}
