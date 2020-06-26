//
//  ForeignComparisonViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class ForeignComparisonViewController: UIViewController, ForeignComparisonView {
	@IBOutlet weak var mainView: ForeignComparisonBinderView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	func show(viewModel: ForeignComparisonViewModel) {
		mainView.populationStack.text = viewModel.population
		mainView.atmosphereStack.text = viewModel.atmosphereType
		mainView.comparisonLabel.text = viewModel.description
		mainView.earthDayEquivalenceStack.text = viewModel.earthDayEquivalence
		mainView.earthYearEquivalenceStack.text = viewModel.earthYearEquivalence
		mainView.planetContainerView.diameterLabel.text = viewModel.planetDiameter
		mainView.planetContainerView.earthGravityUnitsLabel.text = viewModel.planetEarthGComparison
		mainView.terrainView.text = viewModel.terrainType
		mainView.waterCoverageStack.text = viewModel.waterCoverage
	}

}

extension ForeignComparisonViewController: Storyboarded {
	static let storyboardName: String = "ForeignComparisonView"
}
