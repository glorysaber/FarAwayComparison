//
//  WeatherViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, WeatherView {

	@IBOutlet weak var mainView: WeatherMainView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	func show(weatherInfo: WeatherViewModel) {
		mainView.cloudBolt.text = weatherInfo.lightningChance
		mainView.cloudCoverageView.text = weatherInfo.cloudCoveragePercentage
		mainView.temperatureView.text = weatherInfo.temperature
		mainView.uvIndexView.text = weatherInfo.uvIndex
		mainView.rainChance.text = weatherInfo.precipitation
		mainView.cloudSnow.text = weatherInfo.snowfall
		mainView.weatherDescriptionLabel.text = weatherInfo.description
		mainView.weatherBreifImage.image = UIImage(named: weatherInfo.imageBriefName)
		mainView.visibilityView.text = weatherInfo.visibility
	}

}

extension WeatherViewController: Storyboarded {
	static var storyboardName: String = "WeatherView"
}
