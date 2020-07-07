//
//  SWAPI.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

enum SWAPI {
	enum Error: Swift.Error {
		case bundleInfoNotFound(MainBundleInfo)
		case urlNotFound(url: String)
		case malformedResponse(String)
		case errorFromServer(String)
		case error(String)
		case pageDoesNotExist
	}
}
