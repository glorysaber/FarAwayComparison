//
//  SWAPI.Attribute.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension SWAPI {
	/// A response Key to Attribute.root and the available attributes
	enum Attribute: String {
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
}
