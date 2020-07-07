//
//  PermissionsComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class PermissionsComposer {

	func compose(activity: RoutingActivity, locationManager: LocationManager) -> PermissionsViewController {
		let vc = composeVC(activity)

		let presenter = PermissionsPresenter(output: PermissionsViewControllerAdapter(adaptee: vc))

		let locationAdapter = LocationPermissionAdapter(adaptee: presenter)
		let locationPermissionsService = LocationPermissionsServiceModel(locationManager: locationManager)
		locationPermissionsService.onPermissionsUpdate =  locationAdapter.permissionsCallBackResult

		vc.allowPermissionsRequested = locationPermissionsService.getPermission
		vc.reloadData = presenter.start

		return vc
	}

	private func composeVC(_ activity: RoutingActivity) -> PermissionsViewController {
		let vc = PermissionsViewController.instantiate()
		let router = PermissionsRouter( activity: activity)
		vc.router = router
		return vc
	}
}
