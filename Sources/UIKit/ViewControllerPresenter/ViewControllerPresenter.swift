//
//  Presenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/8/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit


/**
	Represents a type that is repsonsible for  presenting and dismissing a single view controller.
	This allows the caller to not have to be worried about or know about the type fo presenter in cases
	of UINavigationControllers vs UIViewControllers or even if the view amy be a child.
*/
protocol ViewControllerPresenter {
	func present(_ viewController: UIViewController)

	func dismiss()
}



