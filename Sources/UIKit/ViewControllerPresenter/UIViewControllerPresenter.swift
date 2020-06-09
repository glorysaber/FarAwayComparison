//
//  UIViewControllerPresenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/8/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

/// Presents and dismisses in the standard way for view controllers
class UIViewControllerPresenter: ViewControllerPresenter {
	let presentingViewController: UIViewController
	let animated: Bool
	private weak var presentedVC: UIViewController? = nil

	init(presentingViewController: UIViewController, animated: Bool) {
		self.presentingViewController = presentingViewController
		self.animated = animated
	}

	func present(_ viewController: UIViewController) {
		if presentedVC != nil {
			dismiss()
		}
		presentingViewController.present(viewController, animated: animated)
	}

	func dismiss() {
		presentingViewController.remove(childViewController: presentedVC)
		presentedVC = nil
	}

}
