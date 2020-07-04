//
//  WeatherResponseData.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol WeatherBitLocation: Encodable {

}

enum WeatherBit {

	typealias Location = WeatherBitLocation

	// MARK: - WeatherData
	struct Response: Codable {
		let data: [Result]
		let count: Int
	}

	// MARK: - Datum
	struct Result: Codable {
		/// Relative humidity (%).
		let relativeHumidity: Int
		/// Part of the day (d = day / n = night
		let partOfTheDay: String
		/// Longitude in Degrees
		let longitude: Double
		/// pressure in (mb)
		let pressure: Double
		/// The Local IANA Timezone
		let timezone: String
		/// Last observation time in (YYYY-MM-DD:HH)
		let lastObservation: String
		/// State abreviation
		let countryCode: String
		/// Cloud coverage (%).
		let cloudCoverage: Int
		/// Last observation time as Unix Timestamp
		let timestamp: Int
		/// Estimated Solar Radiation (W/m^2).
		let estimatedSolarRad: Double
		/// State abreviation/code
		let stateCode: String
		/// The name of the city
		let cityName: String
		/// Wind speed in (default: m/s)
		let windSpeed: Double
		/// Verbal wind direction
		let windDirectionalVerbal: String
		/// Abreviated wind direction
		let windDirectionCardinal: String
		/// Sea level pressure in (mb)
		let seaLevelPressure: Double
		/// Visibility (default KM).
		let visibility: Double
		/// Solar hour angle (degrees).
		let solarHourAngle: Double
		/// Sunset Time
		let sunset: String
		/// Direct normal solar irradiance (W/m^2) [Clear Sky]
		let directNormalSolarIrradiance: Double
		/// Dew point (default Celcius)
		let dewPoint: Double
		/// Snowfall (default mm/hr)
		let snowfall: Int
		/// UV Index (0-11+)
		let uvIndex: Double
		///  Liquid equivalent precipitation rate (default mm/hr)
		let precipitation: Int
		/// Wind direction in degrees
		let windDirectionDegrees: Int
		/// Sunrise Time (HH::MM)
		let sunrise: String
		/// Global horizontal solar irradiance (W/m^2) [Clear Sky]
		let globalHorizontalSolarIrradiance: Double
		/// Diffuse horizontal solar irradiance (W/m^2) [Clear Sky]
		let diffuseHorizontalSolarIrradiance: Double
		///  Air Quality Index [US - EPA standard 0 - +500]
		let airQualityIndex: Int
		/// Lattitude in Degrees
		let lattitude: Double
		/// Contains icon, code, and description
		let weather: Weather
		/// Current Cycle hour
		let cycleHour: String
		/// Tempurature in (default: celsius)
		let temperature: Double
		/// Source Station ID
		let station: String
		/// Solar elevation angle (degrees).
		let solarElevationAngle: Double
		///  Apparent/"Feels Like" temperature (default Celcius).
		let apparentTemperature: Double

		enum CodingKeys: String, CodingKey {
			case relativeHumidity = "rh"
			case partOfTheDay = "pod"
			case longitude = "lon"
			case pressure = "pres"
			case timezone = "timezone"
			case lastObservation = "ob_time"
			case countryCode = "country_code"
			case cloudCoverage = "clouds"
			case timestamp = "ts"
			case estimatedSolarRad = "solar_rad"
			case stateCode = "state_code"
			case cityName = "city_name"
			case windSpeed = "wind_spd"
			case windDirectionalVerbal = "wind_cdir_full"
			case windDirectionCardinal = "wind_cdir"
			case seaLevelPressure = "slp"
			case visibility = "vis"
			case solarHourAngle = "h_angle"
			case sunset = "sunset"
			case directNormalSolarIrradiance = "dni"
			case dewPoint = "dewpt"
			case snowfall = "snow"
			case uvIndex = "uv"
			case precipitation = "precip"
			case windDirectionDegrees = "wind_dir"
			case sunrise = "sunrise"
			case globalHorizontalSolarIrradiance = "ghi"
			case diffuseHorizontalSolarIrradiance = "dhi"
			case airQualityIndex = "aqi"
			case lattitude = "lat"
			case weather = "weather"
			case cycleHour = "datetime"
			case temperature = "temp"
			case station = "station"
			/// Solar elevation angle (degrees).
			case solarElevationAngle = "elev_angle"
			case apparentTemperature = "app_temp"
		}
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

	/// Possible languages for weather
	enum Language: String, Codable {
		case english = "en"
		case arabic = "ar"
		case azerbaijani = "az"
		case belarusian = "be"
		case bulgarian = "bg"
		case bosnian = "bs"
		case catalan = "ca"
		case czech = "cz"
		case danish = "da"
		case german = "de"
		case finnish = "fi"
		case french = "fr"
		case greek = "el"
		case estonian = "et"
		case croatian = "hr"
		case hungarian = "hu"
		case indonesian = "id"
		case italian = "it"
		case icelandic = "is"
		case cornish = "kw"
		case lithuanian = "lt"
		case norwegianBokmål = "nb"
		case dutch = "nl"
		case polish = "pl"
		case portuguese = "pt"
		case romanian = "ro"
		case russian = "ru"
		case slovak = "sk"
		case slovenian = "sl"
		case serbian = "sr"
		case swedish = "sv"
		case turkish = "tr"
		case ukrainian = "uk"
		case chineseSimplified = "zh"
		case chineseTraditional = "zh-tw"
	}

	enum Units: String, Codable {
		case metric = "M", scientific = "S", fahrenheit = "I"
	}

	struct Request: Encodable {
		let meta: RequestMeta
		let location: Location

		func encode(to encoder: Encoder) throws {
			try meta.encode(to: encoder)
			try location.encode(to: encoder)
		}
	}

	struct RequestMeta: Encodable {
		let key: String
		let language: Language
		let units: Units

		enum CodingKeys: String, CodingKey {
			case key
			case language = "lang"
			case units
		}
	}

	struct LatLong: Location {
		var lattitude: String
		var longitude: String
	}

	struct Postal: Location {
		var postal: String
		var country: String?
	}

	struct City: Location {
		var city: String
		var state: String?
		var country: String?

		enum CodingKeys: String, CodingKey {
			case city, country
		}

		func encode(to encoder: Encoder) throws {
			var parameterValue  = "\(city)"

			if let state = state {
				parameterValue.append(",\(state)")
			}

			var container = encoder.container(keyedBy: CodingKeys.self)

			try container.encode(parameterValue, forKey: .city)

			if let country = country {
				try container.encode(country, forKey: .country)
			}
		}
	}
}
