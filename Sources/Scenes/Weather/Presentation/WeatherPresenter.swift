//
//  WeatherPresenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class WeatherPresenter {

	let view: WeatherView

	init(view: WeatherView) {
		self.view = view
	}

	func didGetUpdatedWeatherInfo(model: WeatherViewModel) {
		view.display(weatherInfo: model)
	}
}
