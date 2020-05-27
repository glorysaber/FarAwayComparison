//
//  TermsCoordinator.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/27/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class TermsCoordinator: Coordinator {

	private let presenter: UINavigationController
	private var termsViewController: TermsViewController?

	init(presenter: UINavigationController) {

		self.presenter = presenter

	}

	func start() {
		let termsViewController = TermsViewController.instantiate()
		termsViewController.delegate = self
		presenter.pushViewController(termsViewController, animated: true)
		self.termsViewController = termsViewController
	}




}

extension TermsCoordinator: TermsViewControllerDelegate {
	func termsViewControllerDidAgree() {

	}

}
