//
//  LocationPermissionAdapter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/1/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation


class LocationPermissionAdapter {
	let adaptee: PermissionsPresenter

	init(adaptee: PermissionsPresenter) {
		self.adaptee = adaptee
	}

	func permissionsCallBackResult(_ permissions: LocationPermissionsServiceMock.PermissionsStatus) {
		switch permissions {
		case .allowed:
			adaptee.didGetLocationPermissions()
		case .denied:
			adaptee.doesNotHaveLocationPermissions()
		case .unRequested:
			break
		}
	}
}
