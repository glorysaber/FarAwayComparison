//
//  LocationManager.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol LocationManager {
	var locationServicesAvailable: Bool { get }
	func requestLocationPermissions(for authType: Location.AuthorizationRequest)
	func currentLocationPermissions() -> Location.AuthorizationStatus
	func startListening()
	func stopListening()
}
