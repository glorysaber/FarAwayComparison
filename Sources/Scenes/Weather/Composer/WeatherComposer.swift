//
//  WeatherComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class WeatherComposer {

	func compose(appContainer: AppContainer) -> WeatherViewController {
		let vc = WeatherViewController.instantiate()

		let presenter = WeatherPresenter(view: WeakRef(vc))

		let weatherAdapter = WeatherPresenterAdapter(adaptee: presenter)

		let service = WeatherInfoService(mainModel: appContainer.model, weatherInfoUpdate: weatherAdapter.didGetUpdatedWeatherInfo)

		vc.requestModelRefresh = service.getCurrentWeatherInfo

		return vc
	}
}

extension WeakRef: WeatherView where T: WeatherView {
	func display(weatherInfo: WeatherViewModel) {
		object?.display(weatherInfo: weatherInfo)
	}
}
