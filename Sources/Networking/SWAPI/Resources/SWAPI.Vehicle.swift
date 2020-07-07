//
//  SWAPI+Vehicle.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension SWAPI {
	/// A vehicle.
	struct Vehicle: SWAPIResource {
		/// The maximum number of kilograms that this vehicle can transport.
		let cargoCapacity: String
		/// The maximum length of time that this vehicle can provide consumables for its entire crew
		/// without having to resupply.
		let consumables: String
		/// The cost of this vehicle new, in galactic credits.
		let costInCredits: String
		/// The ISO 8601 date format of the time that this resource was created.
		let created: Date
		/// The number of personnel needed to run or pilot this vehicle.
		let crew: String
		/// the ISO 8601 date format of the time that this resource was edited.
		let edited: Date
		/// An array of Film URL Resources that this vehicle has appeared in.
		let films: [String]
		/// The length of this vehicle in meters.
		let length: String
		/// The manufacturer of this vehicle. Comma seperated if more than one.
		let manufacturer: String
		/// The maximum speed of this vehicle in atmosphere.
		let maxAtmospheringSpeed: String
		/// The model or official name of this vehicle. Such as All Terrain Attack Transport.
		let model: String
		/// The name of this vehicle. The common name, such as Sand Crawler.
		let name: String
		/// The number of non-essential people this vehicle can transport.
		let passengers: String
		/// An array of People URL Resources that this vehicle has been piloted by.
		let pilots: [String]
		/// The hypermedia URL of this resource.
		let url: String
		/// The class of this vehicle, such as Wheeled.
		let vehicleClass: String

		static var attribute: SWAPI.Attribute = .vehicles
		enum SearchableKeys: String {
			case name, model
		}

		enum CodingKeys: String, CodingKey {
			case cargoCapacity = "cargo_capacity"
			case consumables
			case costInCredits = "cost_in_credits"
			case created, crew, edited, films, length, manufacturer
			case maxAtmospheringSpeed = "max_atmosphering_speed"
			case model, name, passengers, pilots, url
			case vehicleClass = "vehicle_class"
		}
	}
}
