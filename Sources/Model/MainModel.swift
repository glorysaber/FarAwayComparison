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
	private let swapiCache = SWAPICache<SWAPI.Planet>()

	private var currentWeather: WeatherBit.WeatherData? {
		didSet {
			if let weather = currentWeather {
				onWeatherRefresh?(.success(weather))
			}
		}
	}

	private var currentComparedPlanet: SWAPI.Planet? {
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

	init(locationManager: LocationManager, swapiClient: SWAPIClient, weatherBitClient: WeatherBitClient) {
		self.locationManager = locationManager
		self.swapiClient = swapiClient
		self.weatherBitClient = weatherBitClient

		startLocation()
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
	private func refreshPlanetComparison() {
		cacheNextAvailablePage()
		searchForMatch()
	}

	private func cacheNextAvailablePage() {
		let completion = { [weak self] (response: Result<SWAPI.Page<SWAPI.Planet>, SWAPI.Error>) in
			switch response {
			case let .success(planetPage):
				self?.swapiCache.pages.append(planetPage)
				self?.searchForMatch()
			case .failure(_):
				break
			//TODO: LOG OR SHOW
			}
		}

		if swapiCache.pages.isEmpty {
			swapiClient.requestAll(of: SWAPI.Planet.self, completion: completion)
		} else if let lastPage = swapiCache.pages.last, lastPage.next != nil {
			swapiClient.getNextPage(from: lastPage, completion: completion)
		}
	}

	private func searchForMatch() {
		guard let firstPlanet = swapiCache.pages.first?.results.first else {
			assert(false, "Cache should ahve at least one resource stored")
			return
		}

		var closestMatch = (planet: firstPlanet, score: scoreComparison(planet: firstPlanet))

		let loopThroughPage = { (page: SWAPI.Page<SWAPI.Planet>) in
			for planet in page.results {
				let newScore = self.scoreComparison(planet: planet)
				if closestMatch.score < newScore {
					closestMatch = (planet, newScore)
				}
			}
		}

		swapiCache.pages.forEach(loopThroughPage)

		while closestMatch.score < 50 || swapiCache.pages.last?.next == nil {
			cacheNextAvailablePage()
			guard let page = swapiCache.pages.last else {
				break
			}
			loopThroughPage(page)
		}

		currentComparedPlanet = closestMatch.planet
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
	private func refreshWeather(location: Location.Coordinate? = nil) {
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
