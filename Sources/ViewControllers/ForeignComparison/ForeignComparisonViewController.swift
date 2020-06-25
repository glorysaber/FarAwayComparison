//
//  ForeignComparisonViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class ForeignComparisonViewController: UIViewController, ForeignComparisonView {
	@IBOutlet weak var mainView: ForeignComparisonViewBinder!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	func show(viewModel: ForeignComparisonViewModel) {
		mainView.populationStack.text = viewModel.population
	}

}

extension ForeignComparisonViewController: Storyboarded {
	static let storyboardName: String = "ForeignComparisonView"
}
