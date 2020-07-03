//
//  RoutingActivity.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/2/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class RoutingActivity {

	private let onFinished: () -> Void

	init(onFinished: @escaping () -> Void) {
		self.onFinished = onFinished
	}

	func finish() {
		onFinished()
	}
}
