//
//  LocationManagerDelegate.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {

	override init() {
		
	}

	func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {

	}

	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

	}

	func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {

	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

	}

	func locationManager(_ manager: CLLocationManager, didFailRangingFor beaconConstraint: CLBeaconIdentityConstraint, error: Error) {

	}

	func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {

	}

	func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {

	}
}
