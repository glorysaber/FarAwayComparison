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
	var termsRouter: TermsRouter?
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
		let rootViewController = RootViewController.instantiate()
		rootViewController.delegate = self
		self.rootViewController = rootViewController

		termsRouter = TermsRouter(presenter: FullScreenViewControllerPresenter(presentingViewController: rootViewController))

		window.rootViewController = rootViewController
    window.makeKeyAndVisible()
  }
  
}

extension ApplicationRouter: RootViewControllerDelegate {
	func rootViewControllerDidMoveToParent() {
			termsRouter?.start()
	}
}
