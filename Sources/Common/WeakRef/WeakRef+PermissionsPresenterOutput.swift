//
//  WeakRef+PermissionsPresenterOutput.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension WeakRef: PermissionsPresenterOutput where T: PermissionsPresenterOutput {
	func display(_ model: PermissionsExplanationViewModel) {
		object?.display(model)
	}

	func display(_ model: PermissionsAlertViewModel) {
		object?.display(model)
	}
}
