//
//  WeatherBitClientAPIProduction.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Alamofire
import Foundation

extension WeatherBit {

	class ClientAPIProduction: WeatherBitClientAPI {

		enum Error: Swift.Error {
			case bundleInfoNotFound(MainBundleInfo)
			case urlNotFound(String)
			case malformedResponse
			case errorFromServer(String)
		}

		/// Sends a weather request and then processes the return to either failure with an error or success with a WeatherAPI.Data object.
		/// - Parameters:
		///   - location: The location to get the current weather forcast for.
		///   - language: Language to use in descriptions
		///   - units: Units for measurements
		///   - completion: The closure to process the results
		func requestWeather(location: WeatherBit.Location, language: WeatherBit.Language = .english, units: WeatherBit.Units = .fahrenheit, completion: @escaping (Result<[WeatherBit.ResultData], Swift.Error>) -> ()) {

			guard let key = MainBundleInfo.weatherBitApiKey.getInfo() else {
				completion(.failure(Error.bundleInfoNotFound(MainBundleInfo.weatherBitApiKey)))
				return
			}

			let headerMeta = HeaderMeta(key: key, language: language, units: units)

			guard  let stringURL = MainBundleInfo.weatherBitApiUrl.getInfo() else {
				completion(.failure(Error.bundleInfoNotFound(MainBundleInfo.weatherBitApiUrl)))
				return
			}

			guard let url = URL(string: stringURL) else {
				completion(.failure(Error.urlNotFound(stringURL)))
				return
			}


			let headers = WeatherBit.Header(meta: headerMeta, location: location).getParameters()

			let httpHeaders = HTTPHeaders(headers)

			AF.request(url, method: .get, parameters: headers).responseDecodable { (dataResponse: DataResponse<WeatherBit.Response, AFError>) in
				switch dataResponse.result {
				case let .success(result):
					guard let data = result.data else {
						if let error = result.error {
							completion(.failure(Error.errorFromServer(error)))
						} else {
							completion(.failure(Error.malformedResponse))
						}
						return
					}

					completion(.success(data))
				case let .failure(error):
					completion(.failure(error))
				}
			}
		}
	}
}
