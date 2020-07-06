//
//  LocationManager.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol LocationManager: AnyObject {
	var delegate: SAKLocationManagerDelegate? { get set }
	/// The last location, updated after delegate call
	var lastLocation: Location.Coordinate? { get }
	var locationServicesAvailable: Bool { get }

	func requestLocationPermissions(for authType: Location.AuthorizationRequest)
	func currentLocationPermissions() -> Location.AuthorizationStatus
	func startListening()
	func stopListening()

}
