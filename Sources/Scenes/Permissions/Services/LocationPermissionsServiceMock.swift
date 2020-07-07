//
//  LocationPermissionsService.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/1/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

final class LocationPermissionsServiceMock: LocationPermissionsService {

	private var currentPermissionsStatus: PermissionsStatus = .unRequested

	var onPermissionsUpdate: ((PermissionsStatus) -> ())?

	func getPermission() {
		currentPermissionsStatus = currentPermissionsStatus == .denied ? .allowed : .denied
		onPermissionsUpdate?(currentPermissionsStatus)
	}

	func currentPermissionStatus() {
		onPermissionsUpdate?(currentPermissionsStatus)
	}

}
