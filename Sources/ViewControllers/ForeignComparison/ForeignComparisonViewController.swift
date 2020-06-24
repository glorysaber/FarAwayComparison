//
//  ForeignComparisonViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class ForeignComparisonViewController: UIViewController {
	@IBOutlet weak var mainView: ForeignComparisonView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ForeignComparisonViewController: Storyboarded {
	static let storyboardName: String = "ForeignComparisonView"
}
