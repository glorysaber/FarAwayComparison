//
//  WeatherViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
	@IBOutlet weak var mainView: WeatherView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}
	


}

extension WeatherViewController: Storyboarded {
	static var storyboardName: String = "WeatherView"
}
