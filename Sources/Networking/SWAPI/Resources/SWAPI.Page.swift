//
//  SWAPI.Page.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension SWAPI {
	struct Page<Resource: SWAPIResource>: Decodable {
		let next: String?
		let previous: String?
		let results: [Resource]
	}
}
