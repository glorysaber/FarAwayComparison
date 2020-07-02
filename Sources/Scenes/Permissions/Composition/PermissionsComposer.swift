//
//  PermissionsComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class PermissionsComposer {
	func compose() -> PermissionsViewController {
		let vc = PermissionsViewController.instantiate()

		let presenter = PermissionsPresenter(output: PermissionsViewControllerAdapter(adaptee: vc))

		let locationAdapter = LocationPermissionAdapter(adaptee: presenter)
		let locationPermissionsService = LocationPermissionsServiceMock(callback: locationAdapter.permissionsCallBackResult)

		vc.allowPermissionsRequested = locationPermissionsService.getPermission
		vc.reloadData = presenter.start

		return vc
	}
}
