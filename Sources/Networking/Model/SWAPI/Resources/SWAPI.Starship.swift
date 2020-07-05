//
//  SWAPI+Starship.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension SWAPI{
	/// A Starship
	struct Starship: SWAPIResource {
		/// The maximum number of kilograms that this starship can transport.
		let cargoCapacity: String
		/// The maximum length of time that this starship can provide consumables for its entire crew
		/// without having to resupply.
		let consumables: String
		/// The cost of this starship new, in galactic credits.
		let costInCredits: String
		/// The ISO 8601 date format of the time that this resource was created.
		let created: Date
		/// The number of personnel needed to run or pilot this starship.
		let crew: String
		/// the ISO 8601 date format of the time that this resource was edited.
		let edited: Date
		/// An array of Film URL Resources that this starship has appeared in.
		let films: [String]
		/// The class of this starships hyperdrive.
		let hyperdriveRating: String
		/// The length of this starship in meters.
		let length: String
		/// The manufacturer of this starship. Comma seperated if more than one.
		let manufacturer: String
		/// The maximum speed of this starship in atmosphere. n/a if this starship is incapable of
		/// atmosphering flight.
		let maxAtmospheringSpeed: String
		/// The Maximum number of Megalights this starship can travel in a standard hour. A Megalight
		/// is a standard unit of distance and has never been defined before within the Star Wars
		/// universe. This figure is only really useful for measuring the difference in speed of
		/// starships. We can assume it is similar to AU, the distance between our Sun (Sol) and
		/// Earth.
		let mglt: String
		/// The model or official name of this starship. Such as T-65 X-wing or DS-1 Orbital Battle
		/// Station.
		let model: String
		/// The name of this starship. The common name, such as Death Star.
		let name: String
		/// The number of non-essential people this starship can transport.
		let passengers: String
		/// An array of People URL Resources that this starship has been piloted by.
		let pilots: [String]
		/// The class of this starship, such as Starfighter or Deep Space Mobile Battlestation.
		let starshipClass: String
		/// The hypermedia URL of this resource.
		let url: String

		static var attribute: SWAPI.Attribute = .starships

		enum CodingKeys: String, CodingKey {
			case cargoCapacity = "cargo_capacity"
			case consumables
			case costInCredits = "cost_in_credits"
			case created, crew, edited, films
			case hyperdriveRating = "hyperdrive_rating"
			case length, manufacturer
			case maxAtmospheringSpeed = "max_atmosphering_speed"
			case mglt = "MGLT"
			case model, name, passengers, pilots
			case starshipClass = "starship_class"
			case url
		}
	}
}
