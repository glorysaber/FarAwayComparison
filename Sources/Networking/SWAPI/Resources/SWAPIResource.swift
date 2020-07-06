//
//  SWAPI+Resource.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol SWAPIResource: Decodable {
	associatedtype SearchableKeys: RawRepresentable
	static var attribute: SWAPI.Attribute { get }
}

extension SWAPIResource {
	static var person: SWAPI.Person.Type { SWAPI.Person.self }
	static var planet: SWAPI.Planet.Type { SWAPI.Planet.self }
	static var starship: SWAPI.Starship.Type { SWAPI.Starship.self }
	static var speices: SWAPI.Species.Type { SWAPI.Species.self }
	static var film: SWAPI.Film.Type { SWAPI.Film.self }
	static var vehicle: SWAPI.Vehicle.Type { SWAPI.Vehicle.self }
}
