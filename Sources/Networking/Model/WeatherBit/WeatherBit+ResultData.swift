//
//  WeatherBit+ResultData.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension WeatherBit {

	struct ResultData: Codable {
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
			case solarElevationAngle = "elev_angle"
			case apparentTemperature = "app_temp"
		}
	}
}
