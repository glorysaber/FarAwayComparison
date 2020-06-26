//
//  RootViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/8/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

protocol RootViewControllerDelegate: class {
	func rootViewControllerDidMoveToParent()
}

class RootViewController: UIViewController {

	weak var delegate: RootViewControllerDelegate? = nil

	override func viewWillAppear(_ animated: Bool) {
		delegate?.rootViewControllerDidMoveToParent()
	}
}

extension RootViewController: Storyboarded {
	static var storyboardName: String = "Root"
}
