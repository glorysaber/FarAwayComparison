//
//  WeatherBit.Error.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension WeatherBit {
	enum Error: Swift.Error {
		case bundleInfoNotFound(MainBundleInfo)
		case urlNotFound(url: String)
		case malformedResponse
		case errorFromServer(String)
		case error(String)
	}
}
