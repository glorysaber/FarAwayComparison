//
//  PlanetComparisonService.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class PlanetComparisonService {
	typealias Callback = (SWAPI.Planet) -> Void

	private let onComparisonUpdate: Callback
	let mainModel: MainModel

	init(mainModel: MainModel, onComparisonUpdate: @escaping Callback) {
		self.onComparisonUpdate = onComparisonUpdate
		self.mainModel = mainModel

		mainModel.onPlanetRefresh = { [weak self] result in
			guard case let .success(planetInfo) = result else {
				return
			}

			self?.onComparisonUpdate(planetInfo)
		}
	}

	func getCurrentComparison() {
		guard let currentComparedPlanet = mainModel.currentComparedPlanet else {
			mainModel.refreshWeather()
			return
		}

		onComparisonUpdate(currentComparedPlanet)
	}
}
