//
//  WeatherResponseData.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

enum WeatherBit {

	typealias Location = WeatherBitLocation

	struct Response: Codable {
		let data: [ResultData]?
		let count: Int?
		let error: String?
	}

	// MARK: - Weather
	/// Contains icon, code, and description
	struct Weather: Codable {
		/// Weather Icon Code
		let icon: String
		/// Weather Code
		let code: String
		/// Textual weather description
		let weatherDescription: String

		enum CodingKeys: String, CodingKey {
			case icon, code
			case weatherDescription = "description"
		}
	}

	enum Units: String, Codable {
		case metric = "M", scientific = "S", fahrenheit = "I"
	}

	struct Header {
		let meta: HeaderMeta
		let location: Location

		func getParameters() -> [String: String] {
			meta.getParameters().merging(location.getParameters(), uniquingKeysWith: { _,_ in fatalError() })
		}
	}

	struct HeaderMeta {
		let key: String
		let language: Language
		let units: Units

		enum CodingKeys: String, CodingKey {
			case key
			case language = "lang"
			case units
		}

		func getParameters() -> [String: String] {
			["key" : key, "lang" : language.rawValue, "units" : units.rawValue]
		}
	}

}
