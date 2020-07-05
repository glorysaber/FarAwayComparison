//
//  SWAPI+Species.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension SWAPI {
	/// A species within the Star Wars universe
	struct Species: SWAPIResource {
		/// The average height of this person in centimeters.
		let averageHeight: String
		/// The average lifespan of this species in years.
		let averageLifespan: String
		/// The classification of this species.
		let classification: String
		/// The ISO 8601 date format of the time that this resource was created.
		let created: Date
		/// The designation of this species.
		let designation: String
		/// The ISO 8601 date format of the time that this resource was edited.
		let edited: Date
		/// A comma-seperated string of common eye colors for this species, none if this species does
		/// not typically have eyes.
		let eyeColors: String
		/// An array of Film URL Resources that this species has appeared in.
		let films: [String]
		/// A comma-seperated string of common hair colors for this species, none if this species
		/// does not typically have hair.
		let hairColors: String
		/// The URL of a planet resource, a planet that this species originates from.
		let homeworld: String
		/// The language commonly spoken by this species.
		let language: String
		/// The name of this species.
		let name: String
		/// An array of People URL Resources that are a part of this species.
		let people: [String]
		/// A comma-seperated string of common skin colors for this species, none if this species
		/// does not typically have skin.
		let skinColors: String
		/// The hypermedia URL of this resource.
		let url: String

		static var attribute: SWAPI.Attribute = .species
		enum SearchableKeys: String {
			case name
		}

		enum CodingKeys: String, CodingKey {
			case averageHeight = "average_height"
			case averageLifespan = "average_lifespan"
			case classification, created, designation, edited
			case eyeColors = "eye_colors"
			case films
			case hairColors = "hair_colors"
			case homeworld, language, name, people
			case skinColors = "skin_colors"
			case url
		}
	}

}
