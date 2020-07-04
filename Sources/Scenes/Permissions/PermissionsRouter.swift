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

	init(activity: RoutingActivity) {
		self.activity = activity
	}

	func finish() {
		activity.finish()
	}
}
