//
//  MainModel.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class MainModel {
	private let locationManager: LocationManager
	private let swapiClient: SWAPIClient
	private let	weatherBitClient: WeatherBitClient

	init(locationManager: LocationManager, swapiClient: SWAPIClient, weatherBitClient: WeatherBitClient) {
		self.locationManager = locationManager
		self.swapiClient = swapiClient
		self.weatherBitClient = weatherBitClient
	}

	func getComparisonPlanetModel(callback: @escaping (SWAPI.Planet) -> Void) {

	}

	func getCurrentWeather(callback: @escaping (WeatherBit.ResultData) -> Void) {

	}
}
