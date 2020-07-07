//
//  WeatherPresenterAdapter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/6/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class WeatherPresenterAdapter {
	let adaptee: WeatherPresenter

	init(adaptee: WeatherPresenter) {
		self.adaptee = adaptee
	}

	func didGetUpdatedWeatherInfo(model: WeatherBit.WeatherData) {

		let weatherViewModel = WeatherViewModel(
			description: model.weather.weatherDescription,
			imageBriefName: "sun.max", // TODO: Choose apropriate image
			temperature: String(model.temperature),
			uvIndex: String(model.uvIndex),
			cloudCoveragePercentage: String(model.cloudCoverage),
			visibility: String(model.visibility),
			precipitation: String(model.precipitation),
			snowfall: String(model.snowfall),
			sunriseOrSet: model.sunrise)

		adaptee.didGetUpdatedWeatherInfo(model: weatherViewModel)
	}
}
