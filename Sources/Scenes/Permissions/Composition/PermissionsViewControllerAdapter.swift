//
//  PermissionsViewControllerAdapter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/1/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class PermissionsViewControllerAdapter: PermissionsPresenterOutput {

	private weak var adaptee: PermissionsViewController?

	init(adaptee: PermissionsViewController) {
		self.adaptee = adaptee
	}

	func display(_ model: PermissionsExplanationViewModel) {
		adaptee?.display(explanation: model)
	}

	func display(_ model: PermissionsAlertViewModel) {
		let alert = UIAlertController(title: "Error", message: model.explanation, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: model.buttonTitle, style: .default, handler: nil))
		adaptee?.present(alert, animated: true, completion: nil)
	}

	func display(_: PermissionsGrantedViewModel) {
		adaptee?.router?.finish()
	}
}
