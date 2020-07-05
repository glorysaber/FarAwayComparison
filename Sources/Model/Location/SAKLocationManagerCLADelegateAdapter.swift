//
//  LocationManagerDelegate.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import CoreLocation

extension Location {

	class CLADelegateAdapter: NSObject, CLLocationManagerDelegate {

		var onAuthorizationChange: (() -> Void)?
		var onLocationData: ((Coordinate) -> Void)?
		var onError: ((Error) -> Void)?

		// The required accuracy in meters for the subscriber to be notified
		var requiredAccuracy: Double = 1000

		func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
			onAuthorizationChange?()
		}

		private func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
			onError?(.locationError(message: error.localizedDescription))
		}

		private func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
			if let error = error {
				onError?(.locationError(message: error.localizedDescription))
			}
		}

		func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
			if let location = locations.filter({ $0.horizontalAccuracy < requiredAccuracy }).last {
				onLocationData?(Coordinate(location: location))
			} else {
				onError?(.noLocationsFoundMatchingParameters)
			}
		}

	}
}
