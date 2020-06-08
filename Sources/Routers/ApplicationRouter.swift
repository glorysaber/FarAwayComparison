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
  let rootViewController: UINavigationController
	let termsRouter: TermsRouter
  
  init(window: UIWindow) {
    
    self.window = window
    rootViewController = UINavigationController()
		rootViewController.navigationBar.isHidden = true

		termsRouter = TermsRouter(presenter: rootViewController)
  }
  
  func start() {
    window.rootViewController = rootViewController
		termsRouter.start()
    window.makeKeyAndVisible()
  }
  
  
  
  
}
