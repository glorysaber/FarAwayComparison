//
//  WeatherInfoService.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class WeatherInfoService {

	let callback: (WeatherViewModel) -> Void

	init(callback: @escaping (WeatherViewModel) -> Void) {
		self.callback = callback
	}

	func getCurrentWeatherInfo() {
		callback(WeatherViewModel(
							description: "It's Sunny",
							imageBriefName: "sun.max",
							temperature: "79°F",
							uvIndex: "9",
							cloudCoveragePercentage: "13%",
							visibility: "12km",
							precipitation: "10 mm/hr",
							snowfall: "0 mm/hr",
							sunriseOrSet: ""))
	}
}
