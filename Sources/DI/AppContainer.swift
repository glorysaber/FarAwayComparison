//
//  AppContainer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/6/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class AppContainer {
	let locationManager = Location.Manager()
	let swapiClient = SWAPI.Client()
	let weatherBitClient = WeatherBit.Client()
	private(set) lazy var model: MainModel = {
		MainModel(
			locationManager: locationManager,
			swapiClient: swapiClient,
			weatherBitClient: weatherBitClient)
	}()
}
