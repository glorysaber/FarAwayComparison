//
//  WeatherBitClientAPIProduction.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension WeatherBit {

	class WeatherBitClientAPIProduction: WeatherBitClientAPI {
		enum Error: Swift.Error {
			case bundleInfoNotFound(MainBundleInfo)
			case urlNotFound(String)
		}

		/// Sends a weather request and then processes the return to either failure with an error or success with a WeatherAPI.Data object.
		/// - Parameters:
		///   - location: The location to get the current weather forcast for.
		///   - language: Language to use in descriptions
		///   - units: Units for measurements
		///   - completion: The closure to process the results
		func requestWeather(location: WeatherBit.Location, language: WeatherBit.Language = .english, units: WeatherBit.Units = .fahrenheit, completion: @escaping (Swift.Result<WeatherBit.Response, Error>) -> ()) {

			guard let key = MainBundleInfo.weatherBitApiKey.getInfo() else {
				completion(.failure(.bundleInfoNotFound(MainBundleInfo.weatherBitApiKey)))
				return
			}

			let requestMeta = RequestMeta(key: key, language: language, units: units)

			guard  let stringURL = MainBundleInfo.weatherBitApiUrl.getInfo() else {
				completion(.failure(.bundleInfoNotFound(MainBundleInfo.weatherBitApiUrl)))
				return
			}

			guard let url = URL(string: stringURL) else {
				completion(.failure(Error.urlNotFound(stringURL)))
				return
			}


			let request = WeatherBit.Request(meta: requestMeta, location: <#T##WeatherBit.Location#>)



		}
	}
}
