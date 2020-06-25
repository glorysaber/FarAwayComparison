//
//  ForeignComparisonView.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/23/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class ForeignComparisonBinderView: UIView {
	@IBOutlet weak var rootVerticalStackView: UIStackView!

	@IBOutlet weak var topHorizontalStackView: UIStackView!

	@IBOutlet weak var planetContainerView: ForeignPlanetView!

	@IBOutlet weak var verticalStackStandardInfo: UIStackView!

	@IBOutlet weak var comaprisonLabel: UILabel!

	@IBOutlet weak var terrainView: ImageAndLabelView!

	@IBOutlet weak var populationStack: ImageAndLabelView!

	@IBOutlet weak var bottomVerticalStack: UIStackView!

	@IBOutlet weak var bottomHorizontalStack: UIStackView!

	@IBOutlet weak var earthYearEquivalenceStack: ImageAndLabelView!

	@IBOutlet weak var earthDayEquivalenceStack: ImageAndLabelView!

	@IBOutlet weak var midHorizontalStack: UIStackView!

	@IBOutlet weak var waterCoverageStack: ImageAndLabelView!

	@IBOutlet weak var atmosphereStack: ImageAndLabelView!

}
