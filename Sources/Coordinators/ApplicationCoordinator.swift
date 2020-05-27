//
//  ApplicationCoordinator.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {

  let window: UIWindow
  let rootViewController: UINavigationController
	let termsCoordinator: TermsCoordinator
  
  init(window: UIWindow) {
    
    self.window = window
    rootViewController = UINavigationController()
    rootViewController.navigationBar.prefersLargeTitles = true

		termsCoordinator = TermsCoordinator(presenter: rootViewController)

  }
  
  func start() {
    window.rootViewController = rootViewController
		termsCoordinator.start()
    window.makeKeyAndVisible()
  }
  
  
  
  
}
