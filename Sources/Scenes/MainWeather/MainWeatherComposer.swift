//
//  MainWeatherComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class MainWeatherComposer {
	func compose() -> MainWeatherViewContainer {
		MainWeatherViewContainer.instantiate() { coder in
			let topVC = WeatherComposer().compose()
			let bottomVC = PlanetInfoComposer().compose()

			return MainWeatherViewContainer(coder: coder, topView: topVC, bottomView: bottomVC)
		}
	}
}
