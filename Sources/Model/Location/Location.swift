//
//  Location.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import CoreLocation

enum Location {

	struct Coordinate {
		let latitude: Double
		let longitude: Double

		init(location: CLLocation) {
			latitude = location.coordinate.latitude
			longitude = location.coordinate.longitude
		}
	}

	enum Error: Swift.Error {
		case permissionsDenied, noLocationsFoundMatchingParameters
		case locationError(message: String)
	}

	enum AuthorizationRequest {
		case always, whileInUse
	}

	enum AuthorizationStatus {
		case notDetermined
		case restricted
		case denied
		case authorizedAlways
		case authorizedWhenInUse

		func isAuthorized() -> Bool {
			self == .authorizedAlways ||
				self == .authorizedWhenInUse
		}

		init(status: CLAuthorizationStatus) {
			switch status {

			case .notDetermined:
				self = .notDetermined
			case .restricted:
				self = .restricted
			case .denied:
				self = .denied
			case .authorizedAlways:
				self = .authorizedAlways
			case .authorizedWhenInUse:
				self = .authorizedWhenInUse
			@unknown default:
				assert(false)
				self = .denied
			}
		}
	}
}
