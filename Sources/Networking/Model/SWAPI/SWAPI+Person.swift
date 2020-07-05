//
//  SWAPI+Person.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension SWAPI {

	/// A person within the Star Wars universe
	struct Person: Codable {
		/// The birth year of this person. BBY (Before the Battle of Yavin) or ABY (After the Battle
		/// of Yavin).
		let birthYear: String
		/// The ISO 8601 date format of the time that this resource was created.
		let created: Date
		/// the ISO 8601 date format of the time that this resource was edited.
		let edited: Date
		/// The eye color of this person.
		let eyeColor: String
		/// An array of urls of film resources that this person has been in.
		let films: [String]
		/// The gender of this person (if known).
		let gender: String
		/// The hair color of this person.
		let hairColor: String
		/// The height of this person in meters.
		let height: String
		/// The url of the planet resource that this person was born on.
		let homeworld: String
		/// The mass of this person in kilograms.
		let mass: String
		/// The name of this person.
		let name: String
		/// The skin color of this person.
		let skinColor: String
		/// The url of the species resource that this person is.
		let species: [String]
		/// An array of starship resources that this person has piloted
		let starships: [String]
		/// The url of this resource
		let url: String
		/// An array of vehicle resources that this person has piloted
		let vehicles: [String]

		enum CodingKeys: String, CodingKey {
			case birthYear = "birth_year"
			case created, edited
			case eyeColor = "eye_color"
			case films, gender
			case hairColor = "hair_color"
			case height, homeworld, mass, name
			case skinColor = "skin_color"
			case species, starships, url, vehicles
		}
	}
}
