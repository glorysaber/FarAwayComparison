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
			temperature: "\(model.temperature)°F",
			uvIndex: String(Int(model.uvIndex)),
			cloudCoveragePercentage: "\(model.cloudCoverage)%",
			visibility: "\(model.visibility)km",
			precipitation: "\(model.precipitation) mm/hr",
			snowfall: "\(model.snowfall) mm/hr",
			sunriseOrSet: model.sunrise)

		adaptee.didGetUpdatedWeatherInfo(model: weatherViewModel)
	}
}
