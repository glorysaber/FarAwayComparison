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

	// MARK - ViewLifeCycle

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		fatalError("Does not Support initialization from nib")
	}

	required init?(coder: NSCoder) {
//		fatalError("Does not Support initialization from coder")
		super.init(coder: coder)
	}

	required init?(coder: NSCoder, topView: UIViewController, bottomView: UIViewController) {
		super.init(coder: coder)
	}

	override func viewDidLoad() {
		let weatherViewController = WeatherComposer().compose()
		addChild(weatherViewController)
		stackView.addArrangedSubview(weatherViewController.view)

		let planetInfoViewController = PlanetInfoComposer().compose()
		addChild(planetInfoViewController)
		stackView.addArrangedSubview(planetInfoViewController.view)
	}
}

extension MainWeatherViewContainer: Storyboarded {
	static var storyboardName: String = "Weather"
}
