//
//  ApplicationRouter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

/**
 Main Application Router used to start the chain of default scenes when launched from a normal context
*/
class ApplicationRouter {

	/// The applications main window
  let window: UIWindow
	/// The windows root View Controller
  weak var rootViewController: RootViewController?
  
  init(window: UIWindow) {
    self.window = window
  }

	/// Start the routing of the application
  func start() {
		let rootViewController = RootViewController.instantiate()
		rootViewController.delegate = self
		self.rootViewController = rootViewController

		window.rootViewController = rootViewController
    window.makeKeyAndVisible()
  }
  
}

extension ApplicationRouter: RootViewControllerDelegate {
	/// Called when the root view controller is ready to present the content of the first scene
	func rootViewControllerDidMoveToParent() {
		let navigationController = UINavigationController()
		navigationController.navigationBar.isHidden = true
		navigationController.pushViewController(TermsViewController.instantiate(), animated: false)
		rootViewController?.addFullScreen(childViewController: navigationController)
	}
}
