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

	override func viewDidLoad() {
		let weatherViewController = WeatherViewController.instantiate()
		addChild(weatherViewController)
		stackView.addArrangedSubview(weatherViewController.view)

		let planetInfoViewController = PlanetInfoViewController.instantiate()
		addChild(planetInfoViewController)
		stackView.addArrangedSubview(planetInfoViewController.view)
	}
}

extension MainWeatherViewContainer: Storyboarded {
	static var storyboardName: String = "Weather"
}
