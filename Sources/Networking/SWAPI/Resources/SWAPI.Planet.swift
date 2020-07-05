//
//  SWAPI+Planet.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension SWAPI {
	/// A planet.
	struct Planet: SWAPIResource {
		/// The climate of this planet. Comma-seperated if diverse.
		let climate: String
		/// The ISO 8601 date format of the time that this resource was created.
		let created: Date
		/// The diameter of this planet in kilometers.
		let diameter: String
		/// the ISO 8601 date format of the time that this resource was edited.
		let edited: Date
		/// An array of Film URL Resources that this planet has appeared in.
		let films: [String]
		/// A number denoting the gravity of this planet. Where 1 is normal.
		let gravity: String
		/// The name of this planet.
		let name: String
		/// The number of standard days it takes for this planet to complete a single orbit of its
		/// local star.
		let orbitalPeriod: String
		/// The average populationof sentient beings inhabiting this planet.
		let population: String
		/// An array of People URL Resources that live on this planet.
		let residents: [String]
		/// The number of standard hours it takes for this planet to complete a single rotation on
		/// its axis.
		let rotationPeriod: String
		/// The percentage of the planet surface that is naturally occuring water or bodies of water.
		let surfaceWater: String
		/// the terrain of this planet. Comma-seperated if diverse.
		let terrain: String
		/// The hypermedia URL of this resource.
		let url: String

		static var attribute: SWAPI.Attribute = .planets
		enum SearchableKeys: String {
			case name
		}

		enum CodingKeys: String, CodingKey {
			case climate, created, diameter, edited, films, gravity, name
			case orbitalPeriod = "orbital_period"
			case population, residents
			case rotationPeriod = "rotation_period"
			case surfaceWater = "surface_water"
			case terrain, url
		}
	}
}
