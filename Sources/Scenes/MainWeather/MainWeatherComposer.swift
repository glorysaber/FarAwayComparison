//
//  MainWeatherComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class MainWeatherComposer {
	func compose(appContainer: AppContainer) -> MainWeatherViewContainer {
		MainWeatherViewContainer.instantiate() { coder in
			let topVC = WeatherComposer().compose(appContainer: appContainer)
			let bottomVC = PlanetInfoComposer().compose()

			return MainWeatherViewContainer(coder: coder, topView: topVC, bottomView: bottomVC)
		}
	}
}
