//
//  MainWeatherViewContainer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class MainWeatherViewContainer: UIViewController {

	@IBOutlet weak var stackView: UIStackView!

	private let topViewController: UIViewController
	private let bottomViewController: UIViewController

	// MARK - ViewLifeCycle

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		fatalError("Does not Support initialization from nib")
	}

	required init?(coder: NSCoder) {
		fatalError("Does not Support initialization from coder")
	}

	required init?(coder: NSCoder, topView: UIViewController, bottomView: UIViewController) {
		topViewController = topView
		bottomViewController = bottomView
		super.init(coder: coder)
	}

	override func viewDidLoad() {
		addChild(topViewController)
		stackView.addArrangedSubview(topViewController.view)

		addChild(bottomViewController)
		stackView.addArrangedSubview(bottomViewController.view)
	}
}

extension MainWeatherViewContainer: Storyboarded {
	static var storyboardName: String = "Weather"
}
