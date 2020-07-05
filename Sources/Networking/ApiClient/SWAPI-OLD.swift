//
//  SWAPI.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 2/16/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

/** All types  containing valid keys for a resource use  this  protocol for the SWAPI.
 */
protocol SWAPIKey: RawRepresentable, CaseIterable, Hashable where RawValue == String {
  static var attribute: SWAPI.Attribute { get }
  static var  searchableKeys: [Self] { get }
}

/** all SWAPI resources  must be able to respond to the corespind SWAPIKeys and self initialize from JSON.
 */
protocol SWAPIResource {
  associatedtype Key: SWAPIKey

  subscript(_ key: Key) -> [String]? { get }

  init(json: SWAPIClient.JSON)
}

/**
 A Namespace for SWAPI API
 */
enum SWAPI {
  /**
   Format to return textual representations as.
   */
  enum Format: String {
    case json = ""
    case wookiee = "wookiee"
  }

  /// A response Key to Attribute.root and the available attributes
  enum Attribute: String, SWAPIKey {
    case root = ""
    case films
    case people
    case planets
    case species
    case starships
    case vehicles

    static var attribute: SWAPI.Attribute = .root
    static let searchableKeys: [Self] = []
  }

  // The endpoint to get the resource with
  enum Endpoint {
    /** Will get all results
     - Warning: Not Supported yet
     */
    case all
    /// If you know the ID for a resource this will return the exact resource
    case id(Int)
    /** Gets the current schema
    - Warning: Not Supported yet
    */
    case schema
    /// Gets a page from a  previous  query.
    case page(Page)
    /** Will search by a search term
     - Warning: Not Supported yet
     */
    case search(String)
  }

  /// A type to allow encapsulation of a pages URL
  struct Page {
    fileprivate let url: String?
  }

  /// Based on: https://swapi.co/documentation#people
  enum ResponseKeys {
    enum People: String, SWAPIKey {
      /// The name of this person.
      case name = "name"
      /// The birth year of the person, using the in-universe standard of BBY or ABY - Before the Battle of Yavin or After the Battle of Yavin. The Battle of Yavin is a battle that occurs at the end of Star Wars episode IV: A New Hope.
      case birthYear = "birth_year"
      /// The eye color of this person. Will be "unknown" if not known or "n/a" if the person does not have an eye
      case eye_color = "eye_color"
      /// Contains a list of url to the given film
      case films = "films"
      /// The gender of this person. Either "Male", "Female" or "unknown", "n/a" if the person does not have a gender.
      case gender = "gender"
      ///  The hair color of this person. Will be "unknown" if not known or "n/a" if the person does not have hair.
      case hairColor = "hair_color"
      /// The height of the person in centimeters.
      case height = "height"
      ///  The URL of a planet resource, a planet that this person was born on or inhabits.
      case homeworld = "homeworld"
      /// The mass of this person in kilograms
      case mass = "mass"
      /// The skin color of this person
      case skin_color = "skin_color"
      /// A timestamp for when this reosurce was created in the form of  ISO 8601
      case created = "created"
      /// A timestamp for when this reosurce was last edited in the form of  ISO 8601
      case edited = "edited"
      /// Contains a list of urls of species this person is related too
      case species = "species"
      /// Contains a list of urls of starships this person has piloted
      case starships = "starships"
      /// The given URL
      case url = "url"
      /// Contains a list of urls of vehicles this person has piloted
      case vehicles = "vehicles"

      static var attribute: SWAPI.Attribute = .people
      static let searchableKeys: [Self] = [.name]
    }

    // TODO: Add markup documentation from https://swapi.co/documentation#films
    enum Films: String, SWAPIKey {
      case title = "title"
      case episodeId = "episode_id"
      case openingCrawl = "opening_crawl"
      case director = "director"
      case producer = "producer"
      case releaseDate = "release_date"
      case species = "species"
      case starships = "starships"
      case vehicles = "vehicles"
      case characters = "characters"
      case planets = "planets"
      case url = "url"
      case created = "created"
      case edited = "edited"

      static var attribute: SWAPI.Attribute = .films
      static let searchableKeys: [Self] = [.title]
    }

    // TODO: Refractor case names and add static string rawRepresentable equal to current case name
    // TODO: Add markup documentation for Starships fields from https://swapi.co/documentation#starships
    enum Starships: String, SWAPIKey {
      case name
      case model
      case starship_class
      case manufacturer
      case cost_in_credits
      case length
      case crew
      case passengers
      case max_atmosphering_speed
      case hyperdrive_rating
      case MGLT
      case cargo_capacity
      case consumables
      case films
      case pilots
      case url
      case created
      case edited

      static var attribute: SWAPI.Attribute = .starships
      static let searchableKeys: [Self] = [.name, .model]
    }

    // TODO: Refractor case names and add static string rawRepresentable equal to current case name
    // TODO: Add markup documentation for Starships fields from https://swapi.co/documentation#vehicles
    enum Vehicles: String, SWAPIKey {
      case name
      case model
      case vehicle_class
      case manufacturer
      case cost_in_credits
      case length
      case crew
      case passengers
      case max_atmosphering_speed
      case cargo_capacity
      case consumables
      case films
      case pilots
      case url
      case created
      case edited

      static var attribute: SWAPI.Attribute = .vehicles
      static let searchableKeys: [Self] = [.name, .model]
    }

    // TODO: Refractor case names and add static string rawRepresentable equal to current case name
    // TODO: Add markup documentation for Starships fields from https://swapi.co/documentation#species
    enum Species: String, SWAPIKey {
      case name
      case classification
      case designation
      case average_height
      case average_lifespan
      case eye_colors
      case hair_colors
      case skin_colors
      case language
      case homeworld
      case people
      case films
      case url
      case created
      case edited

      static var attribute: SWAPI.Attribute = .species
      static let searchableKeys: [Self] = [.name]
    }

    // TODO: Refractor case names and add static string rawRepresentable equal to current case name
    // TODO: Add markup documentation for Starships fields from https://swapi.co/documentation#species
    enum Planets: String, SWAPIKey {
      case name
      case diameter
      case rotation_period
      case orbital_period
      case gravity
      case population
      case climate
      case terrain
      case surface_water
      case residents
      case films
      case url
      case created
      case edited

      static var attribute: SWAPI.Attribute = .planets
      static let searchableKeys: [Self] = [.name]
    }
  }

  // TODO: Make explicit SWAPIResource types for all keys with all allowed variables
  struct ResponseData<Key: SWAPIKey>: SWAPIResource {

    private let data: [Key: [String]]

    init(json: SWAPIClient.JSON) {
      var localData = type(of: data).init()

      for key in Key.allCases {
        if let value = json[key.rawValue] as? String {
          localData[key] = [value]
        } else if let values = json[key.rawValue] as? [String] {
          localData[key] = values
        } else if let value = json[key.rawValue] as? Int {
          localData[key] = [String(value)]
        } else if let values = (json[key.rawValue] as? [Int])?.compactMap( { String($0) }) {
          localData[key] = values
        }
      }

      data = localData
    }

    subscript(_ key: Key) -> [String]? {
      return data[key]
    }
  }

  typealias Person = ResponseData<SWAPI.ResponseKeys.People>
  typealias Planet = ResponseData<SWAPI.ResponseKeys.Planets>
  typealias Vehicle = ResponseData<SWAPI.ResponseKeys.Vehicles>
  typealias Starship = ResponseData<SWAPI.ResponseKeys.Starships>
  typealias Species = ResponseData<SWAPI.ResponseKeys.Species>
  typealias Film = ResponseData<SWAPI.ResponseKeys.Films>

  struct ResourceResponse<Resource: SWAPIResource> {
    let endPoint: Endpoint
    fileprivate let next: String?
    fileprivate let previous: String?

    let results: [Resource]

    init(data: SWAPIClient.JSON, endPoint: Endpoint) throws {
      self.endPoint = endPoint

      switch endPoint {
      case .schema:
        fallthrough
      case .id(_):
        next = nil
        previous = nil
        results = [Resource(json: data)]
        return
      default:
        break
      }

      next = data["next"] as? String
      previous = data["previous"] as? String

      guard let jsonResults = data["results"] as? [SWAPIClient.JSON] else {
        throw SWAPIClient.Error.keyNotFound(key: "results")
      }

      var results = type(of: self.results).init()

      for result in jsonResults {
        results.append(Resource.init(json: result))
      }

      self.results = results
    }

    var hasNextPage: Bool {
      next != nil
    }

    var hasPreviousPage: Bool {
      previous != nil
    }

    var getNextPage: Page {
      return Page(url: next)
    }

    var getPreviousPage: Page {
      return Page(url: previous)
    }
  }

  typealias Result<Resource: SWAPIResource> = Swift.Result<SWAPI.ResourceResponse<Resource>, SWAPIClient.Error>
}

import Alamofire

class SWAPIClient {
	typealias HTTPHeaders = [String:String]
	typealias Parameters = [String:String]
	typealias JSON = [String:NSObject]

	enum Error: Swift.Error {
		case bundleInfoNotFound(MainBundleInfo)
		case keyNotFound(key: String)
		case urlNotFound(url: String? = nil)
		case internalError(String)
		case requestFailed
		case error(Swift.Error)

		var localizedDescription: String {
			switch self {
			case .keyNotFound(let key):
				return "Could Not find result for key: \(key)"
			case .urlNotFound(let url):
				return "Could not connect to URL \(url as Any?)"
			case .internalError(let errorMessage):
				return "InternalError: \(errorMessage)"
			case .requestFailed:
				return "Failed API resquest"
			case .error(let error):
				return "UnMapped Error: \(error)"
			case .bundleInfoNotFound(let info):
				return "Could not find required bundle info: \(info)"
			}
		}
	}

  func requestStarWarsInfo<Resource: SWAPIResource>(with endpoint: SWAPI.Endpoint, as format: SWAPI.Format = .json, resource: Resource.Type = Resource.self, completion: @escaping (SWAPI.Result<Resource>) -> ()) {

    guard let stringURL = MainBundleInfo.swApiUrl.getInfo() else {
      completion(.failure(Error.urlNotFound()))
      return
    }

    guard var url = URL(string: stringURL) else {
      completion(.failure(Error.urlNotFound(url: stringURL)))
      return
    }

    url.appendPathComponent(Resource.Key.attribute.rawValue)

    // The root attribute does not use endpoints
    if Resource.self != SWAPI.Attribute.self {
      switch endpoint {
      case .all:
        break
      case .id(let id):
        url.appendPathComponent(String(id))
      case .schema:
        url.appendPathComponent("schema")
      case .search(let searchString):
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [ URLQueryItem(name: "search", value: searchString)]
        guard let newURL = urlComponents?.url else {
          completion(.failure(Error.urlNotFound(url: stringURL)))
          return
        }

        url = newURL
      case .page(let page):
        guard let pageString = page.url else {
          completion(.failure(.internalError("Could not make request for page")))
          return
        }

        guard let pageURL = URL(string: pageString) else {
          completion(.failure(.internalError("Could not make request for page")))
          return
        }

        url = pageURL
      }
    }
    
		AF.request(url, method: .get, parameters: nil).responseJSON { response in
			switch response.result {
			case .failure(let error):
				completion(.failure(.error(error)))
			case .success(let json):
				do {
					let responseData = try SWAPI.ResourceResponse<Resource>(data: json as! SWAPIClient.JSON, endPoint: endpoint)
					completion(.success(responseData))
				} catch let error as Error {
					completion(.failure(error))
				} catch let error {
					completion(.failure(.error(error)))
				}
			}
		}
  }
}
