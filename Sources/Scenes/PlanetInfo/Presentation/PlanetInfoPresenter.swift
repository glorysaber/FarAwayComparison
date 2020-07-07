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

	func didGetUpdatedComparison(info: SWAPI.Planet) {
		let gravity = String(Int(info.gravity.components(separatedBy: " ").first ?? "1") ?? 1)

		// In Millions
		let population = (Int(info.population) ?? 1000000) / 1000000

		let viewModel = PlanetInfoViewModel(
			population: "\(population)M",
			planetEarthGComparison: "\(gravity)G",
			planetDiameter: "\(info.diameter)km",
			description: info.name,
			terrainType: info.terrain,
			earthYearEquivalence: "\(info.orbitalPeriod) days",
			earthDayEquivalence: "\(info.rotationPeriod)h",
			waterCoverage: "\(info.surfaceWater)%",
			atmosphereType: info.climate)

		view.display(viewModel: viewModel)
	}

}
