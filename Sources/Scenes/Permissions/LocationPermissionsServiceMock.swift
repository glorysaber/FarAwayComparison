//
//  LocationPermissionsService.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/1/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

final class LocationPermissionsServiceMock {

	private var currentPermissionsStatus: PermissionsStatus = .unRequested

	private let callback: (PermissionsStatus) -> ()

	init(callback: @escaping (PermissionsStatus) -> ()) {
		self.callback = callback
	}

	func getPermission() {
		currentPermissionsStatus = currentPermissionsStatus == .denied ? .allowed : .denied
		callback(currentPermissionsStatus)
	}

	func currentPermissionStatus() {
		callback(currentPermissionsStatus)
	}

	enum PermissionsStatus {
		case denied
		case allowed
		case unRequested
	}
}
