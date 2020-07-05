//
//  LocationManager.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import CoreLocation

class LocationManager: NSObject {
	let locationManager = CLLocationManager()
	let locationManagerDelegate = LocationManagerDelegate()

	override init() {
		super.init()
		locationManager.delegate = locationManagerDelegate
	}


}
