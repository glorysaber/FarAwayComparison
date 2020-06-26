//
//  PermissionsPresenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol PermissionsPresenterOutput {
	func present(explanation: PermissionsViewModel)
}

struct PermissionsViewModel {
	let locationExplanation: String
	let locationButtonTitle: String
}

class PermissionsPresenter {
	let output: PermissionsPresenterOutput

	init(output: PermissionsPresenterOutput) {
		self.output = output
	}
}
