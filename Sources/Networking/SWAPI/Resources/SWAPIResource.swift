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

extension SWAPI {

}
