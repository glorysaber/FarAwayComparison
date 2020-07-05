//
//  WeatherBit+Location.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

/// A protocol for all weather location types in WeatherAPI
protocol WeatherBitLocation {
	func getParameters() -> [String: String]
}

extension WeatherBit {
	struct LatLong: WeatherBitLocation {
		var lattitude: String
		var longitude: String

		func getParameters() -> [String: String] {
			return ["lat" : lattitude, "lon" : longitude]
		}
	}

	/// Weather location by city, state and country
	struct City: WeatherBitLocation {
		var city: String
		var state: String?
		var country: String?

		func getParameters() -> [String: String] {
			var parameterValue  = "\(city)"

			if let state = state {
				parameterValue.append(",\(state)")
			}

			var parameters = ["city" : parameterValue]

			if let country = country {
				parameters["country"] = country
			}

			return parameters
		}
	}

	/// Location by postal code and country
	struct Postal: WeatherBitLocation {
		var postal: String
		var country: String?

		init(postal: Int, country: String? = nil) {
			self.postal = String(postal)
			self.country = country
		}

		func getParameters() -> [String: String] {
			let parameterValue  = "\(postal)"

			var parameters = ["postal" : parameterValue]

			if let country = country {
				parameters["country"] = country
			}

			return parameters
		}
	}
}
