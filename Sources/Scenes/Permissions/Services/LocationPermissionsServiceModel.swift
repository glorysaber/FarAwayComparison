//
//  LocationPermissionsServiceModel.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/6/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

final class LocationPermissionsServiceModel: LocationPermissionsService {

	private let locationManager: LocationManager

	var onPermissionsUpdate: ((PermissionsStatus) -> ())?

	init(locationManager: LocationManager) {
		self.locationManager = locationManager

		locationManager.delegate = WeakRef(self)
	}

	func getPermission() {
		locationManager.requestLocationPermissions(for: .whileInUse)
	}

	func currentPermissionStatus() {
		let permissions = locationManager.currentLocationPermissions()
		let status = PermissionsStatus(permissions)
		onPermissionsUpdate?(status)
	}

}

extension LocationPermissionsServiceModel: SAKLocationManagerDelegate {
	func authorizationStatusDidChange() {
		currentPermissionStatus()
	}

	func locationChanged(location: Location.Coordinate) {}

	func locationError(error: Location.Error) {}
}

extension PermissionsStatus {
	init(_ status: Location.AuthorizationStatus) {
		switch status {
		case .notDetermined:
			self = .unRequested
		case .restricted, .denied:
			self = .denied
		case .authorizedAlways, .authorizedWhenInUse:
			self = .allowed
		}
	}
}

