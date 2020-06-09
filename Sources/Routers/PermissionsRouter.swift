//
//  PermissionsRouter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/27/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class PermissionsRouter: Routers {

	private let presenter: ViewControllerPresenter
	private weak var permissionsViewController: PermissionsViewController?

	init(presenter: ViewControllerPresenter) {
		self.presenter = presenter
	}

	func start() {
		let permissionsViewController = PermissionsViewController.instantiate()
		permissionsViewController.delegate = self
		presenter.present(permissionsViewController)
		self.permissionsViewController = permissionsViewController
	}




}

extension PermissionsRouter: PermissionsViewControllerDelegate {
	func permissionsViewControllerPermissionsGranted() {
		
	}

}
