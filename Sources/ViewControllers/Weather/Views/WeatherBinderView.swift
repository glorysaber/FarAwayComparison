//
//  WeatherView.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/23/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class WeatherBinderView: UIView {
	@IBOutlet weak var weatherDescriptionLabel: UILabel!
	@IBOutlet weak var weatherBreifImage: UIImageView!

	@IBOutlet weak var verticalWeatherInfo: UIStackView!
	@IBOutlet weak var horizontalWeatherInfo: UIStackView!

	@IBOutlet weak var temperatureView: ImageAndLabelView!
	@IBOutlet weak var uvIndexView: ImageAndLabelView!
	@IBOutlet weak var cloudCoverageView: ImageAndLabelView!
	@IBOutlet weak var visibilityView: ImageAndLabelView!
	
	@IBOutlet weak var rainChance: ImageAndLabelView!
	@IBOutlet weak var cloudSnow: ImageAndLabelView!
	@IBOutlet weak var cloudBolt: ImageAndLabelView!
}
