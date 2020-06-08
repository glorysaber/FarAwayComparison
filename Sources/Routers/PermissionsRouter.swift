//
//  PermissionsRouter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/27/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class PermissionsRouter: Routers {

	private let presenter: UINavigationController
	private var permissionsViewController: PermissionsViewController?

	init(presenter: UINavigationController) {
		self.presenter = presenter
	}

	func start() {
		let permissionsViewController = PermissionsViewController.instantiate()
		permissionsViewController.delegate = self
		presenter.pushViewController(permissionsViewController, animated: true)
		self.permissionsViewController = permissionsViewController
	}




}

extension PermissionsRouter: PermissionsViewControllerDelegate {
	func permissionsViewControllerPermissionsGranted() {
		
	}

}
