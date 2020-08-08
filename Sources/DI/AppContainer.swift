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
		let planetDataSource = SWAPIAdapter(swapiClient: swapiClient)
		
		return MainModel(
			locationManager: locationManager,
			weatherBitClient: weatherBitClient,
			planetDataSource: planetDataSource)
	}()
}
