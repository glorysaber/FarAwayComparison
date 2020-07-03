//
//  PlanetInfoPresenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class PlanetInfoPresenter {

	let view: PlanetInfoView

	init(view: PlanetInfoView) {
		self.view = view
	}

	func didGetUpdatedComparison() {
		view.display(
			viewModel: PlanetInfoViewModel(
				population: "200k",
				planetEarthGComparison: "1G",
				planetDiameter: "12km",
				description: "Just Like Tatooine",
				terrainType: "Desert",
				earthYearEquivalence: "304 Days",
				earthDayEquivalence: "23 Hours",
				waterCoverage: "1%",
				atmosphereType: "Arid"))
	}

}
