//
//  FullScreenViewControllerPresenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/8/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

/// Adds the viewcontroller as a full view child taking up all of the available view space.
class FullScreenViewControllerPresenter: ViewControllerPresenter {
	private weak var presentingViewController: UIViewController?
	private weak var presentedVC: UIViewController? = nil

	init(presentingViewController: UIViewController) {
		self.presentingViewController = presentingViewController
	}

	func present(_ viewController: UIViewController) {
		guard let presentingViewController = presentingViewController else {
			return
		}

		if presentedVC != nil {
			dismiss()
		}
		presentingViewController.addFullScreen(childViewController: viewController)
	}

	func dismiss() {
		presentingViewController?.remove(childViewController: presentedVC)
		presentedVC = nil
	}
}
