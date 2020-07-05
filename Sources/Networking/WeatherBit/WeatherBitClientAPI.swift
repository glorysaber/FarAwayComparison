//
//  WeatherBitClientAPI.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation
protocol WeatherBitClient {
	associatedtype Error: Swift.Error

	/// Sends a weather request and then processes the return to either failure with an error or success with a WeatherAPI.Data object.
	/// - Parameters:
	///   - location: The location to get the current weather forcast for.
	///   - language: Language to use in descriptions
	///   - units: Units for measurements
	///   - completion: The closure to process the results
	func requestWeather(location: WeatherBit.Location, language: WeatherBit.Language, units: WeatherBit.Units, completion: @escaping (Result<[WeatherBit.ResultData], Error>) -> ())
}
