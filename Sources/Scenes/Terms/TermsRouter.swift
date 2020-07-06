//
//  TermsRouter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class TermsRouter {
	private let activity: RoutingActivity
	private weak var viewController: UIViewController?
	private let container: AppContainer

	init(_ viewController: UIViewController, activity: RoutingActivity, container: AppContainer) {
		self.viewController = viewController
		self.activity = activity
		self.container = container
	}

	func routeToPermissions() {
		let permisionsViewController = PermissionsComposer().compose(activity: activity, locationManager: container.locationManager)
		viewController?.navigationController?.pushViewController(permisionsViewController, animated: true)
	}
}
