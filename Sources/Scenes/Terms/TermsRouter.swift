//
//  TermsRouter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class TermsRouter {
	var activity: RoutingActivity
	weak var viewController: UIViewController?

	init(_ viewController: UIViewController, activity: RoutingActivity) {
		self.viewController = viewController
		self.activity = activity
	}

	func routeToPermissions() {
		let permisionsViewController = PermissionsComposer().compose(activity: activity)
		viewController?.navigationController?.pushViewController(permisionsViewController, animated: true)
	}
}
