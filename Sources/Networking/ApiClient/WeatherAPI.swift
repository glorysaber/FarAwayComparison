//
//  WeatherRequest.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 2/10/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

/// A protocol for all weather location types in WeatherAPI
protocol WeatherLocation {
  func getParameters() -> ApiClient.Parameters
}

/// Weather location by lattitude and longitude
enum WeatherAPI {
  struct LatLong: WeatherLocation {
    var lattitude: String
    var longitude: String
    
    func getParameters() -> ApiClient.Parameters {
      return ["lat" : lattitude, "lon" : longitude]
    }
  }
  
  /// Weather location by city, state and country
  struct City: WeatherLocation {
    var city: String
    var state: String?
    var country: String?
    
    func getParameters() -> ApiClient.Parameters {
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
  struct Postal: WeatherLocation {
    var postal: String
    var country: String?
    
    init(postal: Int, country: String? = nil) {
      self.postal = String(postal)
      self.country = country
    }
    
    func getParameters() -> ApiClient.Parameters {
      let parameterValue  = "\(postal)"
      
      var parameters = ["postal" : parameterValue]
      
      if let country = country {
        parameters["country"] = country
      }
      
      return parameters
    }
  }
  
  /// Measurement formats supported
  enum Units: String  {
    case metric = "M", scientific = "S", fahrenheit = "I"
  }
  
  /// Possible languages for weather
  enum Langugage: String {
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
  
  
  /// All the possible fields in a weather response
  enum ResponseKeys: String, CaseIterable {
    /// Count of returned observations
    case count = "count"
    /// tag in which all data is contained
    case data = "data"
    
    enum Data: String, CaseIterable {
      /// Lattitude in Degrees
      case lattitude = "lat"
      /// Longitude in Degrees
      case longitude = "lon"
      /// Sunrise Time (HH::MM)
      case sunrise = "sunrise"
      /// Sunset Time
      case sunset = "sunset"
      /// The Local IANA Timezone
      case timezone = "timezone"
      /// Source Station ID
      case station = "station"
      /// Last observation time in (YYYY-MM-DD:HH)
      case lastObservation = "ob_time"
      /// Current Cycle hour
      case cycleHour = "datetime"
      /// Last observation time as Unix Timestamp
      case timestamp = "ts"
      /// The name of the city
      case cityName = "city_name"
      /// State abreviation
      case countryCode = "country_code"
      /// State abreviation/code
      case stateCode = "state_code"
      /// pressure in (mb)
      case pressure = "pres"
      /// Sea level pressure in (mb)
      case seaLevelPressure = "slp"
      /// Wind speed in (default: m/s)
      case windSpeed = "wind_spd"
      /// Wind direction in degrees
      case windDirectionDegrees = "wind_dir"
      /// Abreviated wind direction
      case windDirectionCardinal = "wind_cdir"
      /// Verbal wind direction
      case windDirectionalVerbal = "wind_cdir_full"
      /// Tempurature in (default: celsius)
      case temperature = "temp"
      ///  Apparent/"Feels Like" temperature (default Celcius).
      case apparentTemperature = "app_temp"
      /// Relative humidity (%).
      case relativeHumidity = "rh"
      /// Dew point (default Celcius)
      case dewPoint = "dewpt"
      /// Cloud coverage (%).
      case cloudCoverage = "clouds"
      /// Part of the day (d = day / n = night
      case partOfTheDay = "pod"
      /// Contains icon, code, and description
      case weather = "weather"
      /// Contains icon, code, and description
      enum Weather: String, CaseIterable {
        /// Weather Icon Code
        case icon = "icon"
        /// Weather Code
        case code = "code"
        /// Textual weather description
        case description = "description"
      }
      /// Visibility (default KM).
      case visibility = "vis"
      ///  Liquid equivalent precipitation rate (default mm/hr
      case precipitation = "precip"
      /// Snowfall (default mm/hr)
      case snowfall = "snow"
      /// UV Index (0-11+)
      case uvIndex = "uv"
      ///  Air Quality Index [US - EPA standard 0 - +500]
      case airQualityIndex = "aqi"
      /// Diffuse horizontal solar irradiance (W/m^2) [Clear Sky]
      case diffuseHorizontalSolarIrradiance = "dhi"
      /// Direct normal solar irradiance (W/m^2) [Clear Sky]
      case directNormalSolarIrradiance = "dni"
      /// Global horizontal solar irradiance (W/m^2) [Clear Sky]
      case globalHorizontalSolarIrradiance = "ghi"
      /// Estimated Solar Radiation (W/m^2).
      case estimatedSolarRad = "solar_rad"
      /// Solar elevation angle (degrees).
      case solarElevationAngle = "elev_angle"
      /// Solar hour angle (degrees).
      case solarHourAngle = "h_angle"
    }
  }
  
  
  /// Contains the data related to a weather API request
  struct Data {
    
    typealias Value = Any
    private typealias InternalDict = [ResponseKeys.Data:Value]
    private typealias WeatherDict = [ResponseKeys.Data.Weather:Value]
    
    enum Error: Swift.Error {
      case didNotFindTopLevelKey
    }
    
    private let data: InternalDict
    
    init(data: ApiClient.JSON) throws {
      var convertedData = InternalDict()
      
      for (key, value) in data {
        guard let responseKey = ResponseKeys.Data(rawValue: key ) else {
          continue
        }
        
        if responseKey == .weather {
          guard let weatherDict = value as? ApiClient.JSON else { continue }
          var weatherByResponseKey = WeatherDict()
          
          for (weatherKey, value) in weatherDict {
            if let responseKey = ResponseKeys.Data.Weather(rawValue: weatherKey) {
              weatherByResponseKey[responseKey] = value
            }
          }
          
          convertedData[responseKey] = weatherByResponseKey
          continue
        }
        
        convertedData[responseKey] = value
      }
      
      self.data = convertedData
    }
    
    func get(_ key: ResponseKeys.Data) -> Value? {
      return data[key]
    }
    
    func get(_ key: ResponseKeys.Data.Weather) -> Value? {
      let weatherDict = data[.weather] as? WeatherDict
      return weatherDict?[key]
    }
    
    subscript(_ key: ResponseKeys.Data) -> Value? {
      return get(key)
    }
    
    subscript(_ key: ResponseKeys.Data.Weather) -> Value? {
      return get(key)
    }
    
    func count() -> Int {
      return data.count
    }
    
    func makeIterator() -> some IteratorProtocol {
      return data.makeIterator()
    }
  }
}

extension ApiClient {
  
  /// Sends a weather request and then processes the return to either failure with an error or success with a WeatherAPI.Data object.
  /// - Parameters:
  ///   - location: The location to get the current weather forcast for.
  ///   - language: Language to use in descriptions
  ///   - units: Units for measurements
  ///   - completion: The closure to process the results
  func requestWeather(location: WeatherLocation, language: WeatherAPI.Langugage = .english, units: WeatherAPI.Units = .fahrenheit, completion: @escaping (Result<[WeatherAPI.Data], Error>) -> ()) {
    
    guard let key = MainBundleInfo.weatherBitApiKey.getInfo() else {
      completion(.failure(Error.bundleInfoNotFound(MainBundleInfo.weatherBitApiKey)))
      return
    }
    
    guard  let stringURL = MainBundleInfo.weatherBitApiUrl.getInfo() else {
      completion(.failure(Error.urlNotFound()))
      return
    }
    
    guard let url = URL(string: stringURL) else {
      completion(.failure(Error.urlNotFound(url: stringURL)))
      return
    }
    
    var parameters: Parameters = ["key" : key, "lang" : language.rawValue, "units" : units.rawValue]
    
    do {
      try parameters.merge(location.getParameters()) { (key, value) in
        // In debug mode we want a crash
        assert(false)
        throw Error.internalError("Unexpected Duplicate Key")
      }
      
      
      self.requestJSON(url, method: .get, parameters: parameters) { response in
        switch response {
        case .failure(let error):
          completion(.failure(error))
        case .success(let json):
          do {
            guard let weatherItems = json[WeatherAPI.ResponseKeys.data.rawValue] as? NSArray as? [JSON] else {
              completion(.failure(Error.internalError("Could not convert from JSON due to missing/corrupt top level key")))
              return
            }
            
            let weatherJSON = try weatherItems.map() { try WeatherAPI.Data(data: $0) }
            
            completion(.success(weatherJSON))
          } catch {
            completion(.failure(Error.internalError("Could not convert from JSON due to missing top level key")))
          }
        }
      }
      
    } catch let error as ApiClient.Error {
      completion(.failure(error))
      return
    } catch let error {
      completion(.failure(ApiClient.Error.error(error)))
    }
  }
}
