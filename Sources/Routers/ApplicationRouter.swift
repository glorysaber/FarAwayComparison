//
//  ApplicationRouter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class ApplicationRouter: Routers {

  let window: UIWindow
  weak var rootViewController: RootViewController?
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
		let rootViewController = RootViewController.instantiate()
		rootViewController.delegate = self
		self.rootViewController = rootViewController

		window.rootViewController = rootViewController
    window.makeKeyAndVisible()
  }
  
}

extension ApplicationRouter: RootViewControllerDelegate {
	func rootViewControllerDidMoveToParent() {
		let navigationController = UINavigationController()
		navigationController.navigationBar.isHidden = true
		navigationController.pushViewController(TermsViewController.instantiate(), animated: false)
		rootViewController?.addFullScreen(childViewController: navigationController)
	}
}
