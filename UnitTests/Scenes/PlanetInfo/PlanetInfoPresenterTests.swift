//
//  PlanetInfoPresenterTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class PlanetInfoPresenterTests: XCTestCase {

	func test() {
		let (sut, spy) = makeSUT()

		sut.didGetUpdatedComparison()

		XCTAssertEqual(spy.displayCalls, 1)
	}

}

private extension PlanetInfoPresenterTests {
	class PlanetInfoPresenterViewSpy: PlanetInfoView {
		var displayCalls = 0

		func display(viewModel: PlanetInfoViewModel) {
			displayCalls += 1
		}
	}

	func makeSUT() -> (PlanetInfoPresenter, PlanetInfoPresenterViewSpy) {
		let spy = PlanetInfoPresenterViewSpy()
		let sut = PlanetInfoPresenter(view: spy)
		return (sut, spy)
	}
}
