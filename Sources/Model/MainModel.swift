//
//  MainModel.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol PlanetDataSource {
	func requestNewPlanetData(completion: ((Result<[SWAPI.Planet], Error>) -> Void)?)
	func makeIterator() -> AnyIterator<SWAPI.Planet>
	func canGetNewData() -> Bool
}

class MainModel {
	private let locationManager: LocationManager
	private let	weatherBitClient: WeatherBitClient
	private let planetDataSource: PlanetDataSource

	private(set) var currentWeather: WeatherBit.WeatherData? {
		didSet {
			if let weather = currentWeather {
				onWeatherRefresh?(.success(weather))
			}
		}
	}

	private(set) var currentComparedPlanet: SWAPI.Planet? {
		didSet {
			if let planet = currentComparedPlanet {
				onPlanetRefresh?(.success(planet))
			}
		} 
	}

	var onPlanetRefresh: ((Result<SWAPI.Planet, Error>) -> Void)? {
		didSet {
			if let planet = currentComparedPlanet {
				onPlanetRefresh?(.success(planet))
			}
		}
	}

	var onWeatherRefresh: ((Result<WeatherBit.WeatherData, Error>) -> Void)? {
		didSet {
			if let weather = currentWeather {
				onWeatherRefresh?(.success(weather))
			}
		}
	}

	init(locationManager: LocationManager, weatherBitClient: WeatherBitClient, planetDataSource: PlanetDataSource) {
		self.locationManager = locationManager
		self.weatherBitClient = weatherBitClient
		self.planetDataSource = planetDataSource

		startLocation()
		
		if let location = locationManager.lastLocation {
			refreshWeather(location: location)
		}
	}

	private func startLocation() {
		locationManager.delegate = self
		guard locationManager.currentLocationPermissions().isAuthorized() else {
			//TODO: Show Error
			return
		}

		locationManager.startListening()
	}


	/// Searches for a comparible planet to the current weather conditions.
	/// If the current weather is not already cached, a fetch request for weatherdata will also be generated.
	func refreshPlanetComparison() {
		planetDataSource.requestNewPlanetData { [weak self] (newResults) in
			self?.searchForMatch()
		}
	}

	private func searchForMatch() {

		var closestMatch: (planet: SWAPI.Planet, score: Int)?
		
		for planet in planetDataSource.makeIterator() {
			let newScore = self.scoreComparison(planet: planet)
			if closestMatch?.score ?? 0 <= newScore {
				closestMatch = (planet, newScore)
			}
		}
		
		currentComparedPlanet = closestMatch?.planet

		if closestMatch?.score ?? 0 < 50 && planetDataSource.canGetNewData() {
			planetDataSource.requestNewPlanetData() { [weak self] _ in
				self?.searchForMatch()
			}
		}
	}

	private func scoreComparison(planet: SWAPI.Planet) -> Int {
		guard let currentWeather = currentWeather else {
			return -1 // TODO Log error
		}

		let planetSurfaceWater = Int(planet.surfaceWater) ?? 0
		let precipitation =	currentWeather.precipitation

		let difference = abs(planetSurfaceWater - precipitation) // TODO: Score apropriately
		return 100 - difference
	}

	/// Fetches the weather info for the current location if possible.
	func refreshWeather(location: Location.Coordinate? = nil) {
		guard let location = location ?? locationManager.lastLocation else {
			//TODO log or show user
			return
		}

		let weatherLocation: WeatherBit.LatLong = WeatherBit.LatLong(
			lattitude: String(location.latitude),
			longitude: String(location.longitude))

		weatherBitClient.requestWeather(location: weatherLocation, language: .english, units: .fahrenheit) { [weak self] response in
			switch response {
			case let .success(data):
				guard let weatherResponse = data.first else {
					//TODO: Log or Show error
					return
				}
				self?.currentWeather = weatherResponse
				self?.refreshPlanetComparison()
			case .failure(_):
				//TODO: Log or Show error
				break
			}
		}
		
	}
}

extension MainModel: SAKLocationManagerDelegate {
	func authorizationStatusDidChange() {
		guard locationManager.currentLocationPermissions().isAuthorized() else {
			// TODO: Show Error
			return
		}
	}

	func locationChanged(location: Location.Coordinate) {
		refreshWeather(location: location)
	}

	func locationError(error: Location.Error) {
		// TODO: show error
	}


}
