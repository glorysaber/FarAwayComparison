//
//  LocationManager.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import CoreLocation

protocol SAKLocationManagerDelegate {
	func authorizationStatusDidChange()
	func locationChanged(location: Location.Coordinate)
	func locationError(error: Location.Error)
}

extension Location {

	class Manager: NSObject {
		let locationManager = CLLocationManager()
		let claDelegateAdapter = CLADelegateAdapter()

		var delegate: SAKLocationManagerDelegate

		init(delegate: SAKLocationManagerDelegate) {
			self.delegate = delegate
			super.init()
			claDelegateAdapter.onError = { [weak self] in
				self?.delegate.locationError(error: $0)
			}
			claDelegateAdapter.onAuthorizationChange = { [weak self] in
				self?.delegate.authorizationStatusDidChange()
			}
			claDelegateAdapter.onLocationData = { [weak self] in
				self?.delegate.locationChanged(location: $0)
			}

			locationManager.delegate = claDelegateAdapter
		}

		var locationServicesAvailable: Bool {
			CLLocationManager.significantLocationChangeMonitoringAvailable()
		}

		func requestLocationPermissions(for authType: AuthorizationRequest) {

			guard currentLocationPermissions() == .notDetermined else {
				delegate.locationError(error: .permissionsDenied)
				return
			}

			switch authType {
			case .whileInUse:
				locationManager.requestWhenInUseAuthorization()
			case .always:
				locationManager.requestAlwaysAuthorization()
			}
		}

		func currentLocationPermissions() -> AuthorizationStatus {
			if #available(iOS 14.0, *) {
				return AuthorizationStatus(status: locationManager.authorizationStatus())
			} else {
				return AuthorizationStatus(status: CLLocationManager.authorizationStatus())
			}
		}

		func startListening() {
			locationManager.startMonitoringSignificantLocationChanges()
		}

		func stopListening() {
			locationManager.stopMonitoringSignificantLocationChanges()
		}
	}
}
