//
//  PermissionsRouter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/2/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class PermissionsRouter {
	var activity: RoutingActivity
	weak var viewController: UIViewController?

	init(_ viewController: UIViewController, activity: RoutingActivity) {
		self.viewController = viewController
		self.activity = activity
	}

	func finish() {
		activity.finish()
	}
}
