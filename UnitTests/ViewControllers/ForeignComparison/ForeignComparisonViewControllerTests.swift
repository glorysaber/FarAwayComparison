//
//  ForeignComparisonViewControllerTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 6/24/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class ForeignComparisonViewControllerTests: XCTestCase {

	func test_viewsNotNil() {
		XCTAssertNotNil(makeSUT().view)
		XCTAssertNotNil(makeSUT().mainView)
	}

	func test_viewsEqual() {
		let sut = makeSUT()

		XCTAssertEqual(sut.mainView, sut.view)
	}

	func test_viewDoesShow_population() {
		let sut = makeSUT()
		let model = makeForeignComparisonModel()

		sut.show(viewModel: model)

		XCTAssertEqual(model.population, sut.mainView.populationStack.text)
	}

	func makeSUT() -> ForeignComparisonViewController {
		let sut = ForeignComparisonViewController.instantiate()
		_ = sut.view
		return sut
	}

	func makeForeignComparisonModel() -> ForeignComparisonViewModel {
		ForeignComparisonViewModel(population: "11k")
	}
}
