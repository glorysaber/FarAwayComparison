//
//  UIViewController+FullScreen.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/8/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

extension UIViewController {

	public func addFullScreen(childViewController child: UIViewController) {
		guard child.parent == nil else {
			return
		}

		addChild(child)
		view.addSubview(child.view)
		child.willMove(toParent: self)

		child.view.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			view.leadingAnchor.constraint(equalTo: child.view.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
			view.topAnchor.constraint(equalTo: child.view.topAnchor),
			view.bottomAnchor.constraint(equalTo: child.view.bottomAnchor),
		])

		child.didMove(toParent: self)
	}

	public func remove(childViewController child: UIViewController?) {
		guard let child = child else {
			return
		}

		guard child.parent != nil else {
			return
		}

		child.willMove(toParent: nil)
		child.view.removeFromSuperview()
		child.removeFromParent()
	}
}
