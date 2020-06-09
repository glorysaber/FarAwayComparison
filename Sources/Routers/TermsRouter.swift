//
//  TermsRouter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/27/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class TermsRouter: Routers {

	private let presenter: ViewControllerPresenter
	private weak var termsViewController: TermsViewController?
	private var permissionsRouter: PermissionsRouter?

	init(presenter: ViewControllerPresenter) {
		self.presenter = presenter
	}

	func start() {
		let termsViewController = TermsViewController.instantiate()
		termsViewController.delegate = self
		presenter.present(termsViewController)
		self.termsViewController = termsViewController
	}

}

extension TermsRouter: TermsViewControllerDelegate {
	func termsViewControllerDidAgree() {
		guard let termsViewController = termsViewController else { return }
		let permissionsRouter = PermissionsRouter(presenter: UIViewControllerPresenter(presentingViewController: termsViewController, animated: true))
		permissionsRouter.start()
		self.permissionsRouter = permissionsRouter
	}

}
