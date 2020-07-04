//
//  WeatherComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class WeatherComposer {

	func compose() -> WeatherViewController {
		let vc = WeatherViewController.instantiate()

		let presenter = WeatherPresenter(view: WeakRef(vc))

		let service = WeatherInfoService(callback: presenter.didGetUpdatedWeatherInfo)

		vc.requestModelRefresh = service.getCurrentWeatherInfo

		return vc
	}
}

extension WeakRef: WeatherView where T: WeatherView {
	func display(weatherInfo: WeatherViewModel) {
		object?.display(weatherInfo: weatherInfo)
	}
}
