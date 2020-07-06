//
//  SWAPICache.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class SWAPICache<Resource: SWAPIResource> {
	var pages: [SWAPI.Page<Resource>] = []
}
