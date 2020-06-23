//
//  WeatherView.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/23/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class WeatherView: UIView {
	@IBOutlet weak var weatherDescriptionlabel: UILabel!

	@IBOutlet weak var horizontalWeatherStack: UIStackView!

	@IBOutlet weak var rainChanceStack: UIStackView!
	@IBOutlet weak var rainChanceImage: UIImageView!
	@IBOutlet weak var rainchanceLabel: UILabel!

	@IBOutlet weak var snowChanceStack: UIStackView!
	@IBOutlet weak var cloudChanceImage: UIImageView!
	@IBOutlet weak var cloudChanceLabel: UILabel!

	@IBOutlet weak var lightningChanceStack: UIStackView!
	@IBOutlet weak var lightningChanceImage: UIImageView!
	@IBOutlet weak var ligtningChanceLabel: UILabel!

	@IBOutlet weak var weatherImage: UIImageView!
	
	@IBOutlet weak var verticalStack: UIStackView!
	
}
