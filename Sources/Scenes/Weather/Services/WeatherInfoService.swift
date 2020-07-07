//
//  WeatherInfoService.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/6/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class WeatherInfoService {
	typealias Callback = (WeatherBit.WeatherData) -> Void

	let weatherInfoUpdate: Callback
	let mainModel: MainModel

	init(mainModel: MainModel, weatherInfoUpdate: @escaping Callback) {
		self.weatherInfoUpdate = weatherInfoUpdate
		self.mainModel = mainModel

		mainModel.onWeatherRefresh = { [weak self] result in
			guard case let .success(weatherData) = result else {
				return
			}

			self?.weatherInfoUpdate(weatherData)
		}
	}

	func getCurrentWeatherInfo() {
		guard let currenWeather = mainModel.currentWeather else {
			mainModel.refreshWeather()
			return
		}

		weatherInfoUpdate(currenWeather)
	}
}
