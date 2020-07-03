//
//  PlanetInfoViewModel.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/25/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

struct PlanetInfoViewModel {
	/// Population of the planet
	let population: String
	/// Gravity measured in earth gravity units
	let planetEarthGComparison: String
	/// Diameter of the planet
	let planetDiameter: String
	///	description of planet
	let description: String
	/// terrain type of planet
	let terrainType: String
	/// Earth Days equal to 1 year of the foreign planet
	let earthYearEquivalence: String
	/// Earth hours equivalent to 1 foreign day
	let earthDayEquivalence: String
	/// percentage of the surface which is covered by water
	let waterCoverage: String
	/// the type of atmoshphere E.G. Arid
	let atmosphereType: String
}
