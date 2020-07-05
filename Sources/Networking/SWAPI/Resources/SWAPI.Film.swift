//
//  SWAPI+Film.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension SWAPI {

	/// A Star Wars film
	struct Film: SWAPIResource {
		/// The people resources featured within this film.
		let characters: [String]
		/// The ISO 8601 date format of the time that this resource was created.
		let created: Date
		/// The director of this film.
		let director: String
		/// the ISO 8601 date format of the time that this resource was edited.
		let edited: Date
		/// The episode number of this film.
		let episodeID: Int
		/// The opening crawl text at the beginning of this film.
		let openingCrawl: String
		/// The planet resources featured within this film.
		let planets: [String]
		/// The producer(s) of this film.
		let producer: String
		/// The release date at original creator country.
		let releaseDate: String
		/// The species resources featured within this film.
		let species: [String]
		/// The starship resources featured within this film.
		let starships: [String]
		/// The title of this film.
		let title: String
		/// The url of this resource
		let url: String
		/// The vehicle resources featured within this film.
		let vehicles: [String]

		static var attribute: SWAPI.Attribute = .films
		enum SearchableKeys: String {
			case title
		}

		enum CodingKeys: String, CodingKey {
			case characters, created, director, edited
			case episodeID = "episode_id"
			case openingCrawl = "opening_crawl"
			case planets, producer
			case releaseDate = "release_date"
			case species, starships, title, url, vehicles
		}
	}
}
