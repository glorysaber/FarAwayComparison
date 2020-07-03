//
//  PlanetInfoViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class PlanetInfoViewController: UIViewController, PlanetInfoView {
	@IBOutlet weak var mainView: PlanetInfoBinderView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	func show(viewModel: PlanetInfoViewModel) {
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

extension PlanetInfoViewController: Storyboarded {
	static let storyboardName: String = "PlanetInfoView"
}
