//
//  PlanetComparisonService.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class PlanetComparisonService {

	private let callback: (PlanetInfoViewModel) -> Void

	init(callback: @escaping (PlanetInfoViewModel) -> Void) {
		self.callback = callback
	}

	func getCurrentComparison() {
		callback(PlanetInfoViewModel(
							population: "201k",
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
