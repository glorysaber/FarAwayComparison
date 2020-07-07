//
//  WeakRef+LocationManagerDelegate.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/6/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension WeakRef: SAKLocationManagerDelegate where T: SAKLocationManagerDelegate {
	func authorizationStatusDidChange() {
		object?.authorizationStatusDidChange()
	}

	func locationChanged(location: Location.Coordinate) {
		object?.locationChanged(location: location)
	}

	func locationError(error: Location.Error) {
		object?.locationError(error: error)
	}
}
