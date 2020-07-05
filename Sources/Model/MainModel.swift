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

	var onLocationChange: ((Location.Coordinate) -> Void)? {
		didSet {
			if let location = locationManager.lastLocation {
				onLocationChange?(location)
			}
		}
	}

	var onLocationError: ((Location.Error) -> Void)? {
		didSet {
			guard locationManager.currentLocationPermissions().isAuthorized() else {
				onLocationError?(.permissionsDenied)
				return
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
			onLocationError?(.permissionsDenied)
			return
		}

		locationManager.startListening()
	}


	/// Searches for a comparible planet to the current weather conditions.
	/// If the current weather is not already cached, a fetch request for weatherdata will also be generated.
	/// - Parameter callback: Call back when a match is found.
	func getComparisonPlanetModel(callback: @escaping (Result<SWAPI.Planet, Error>) -> Void) {

	}


	/// Fetches the weather info for the current location if possible.
	/// - Parameter callback: Call back witht he weather data retrieved
	func getCurrentWeather(callback: @escaping (Result<WeatherBit.WeatherData, Error>) -> Void) {
		
	}
}

extension MainModel: SAKLocationManagerDelegate {
	func authorizationStatusDidChange() {
		guard locationManager.currentLocationPermissions().isAuthorized() else {
			onLocationError?(.permissionsDenied)
			return
		}
	}

	func locationChanged(location: Location.Coordinate) {
		onLocationChange?(location)
	}

	func locationError(error: Location.Error) {
		onLocationError?(error)
	}


}
