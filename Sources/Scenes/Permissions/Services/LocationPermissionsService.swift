//
//  LocationPermissionsService.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/6/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol LocationPermissionsService {
	var onPermissionsUpdate: ((PermissionsStatus) -> ())? { get set }

	func getPermission()
	func currentPermissionStatus()
}

enum PermissionsStatus {
	case denied
	case allowed
	case unRequested
}
