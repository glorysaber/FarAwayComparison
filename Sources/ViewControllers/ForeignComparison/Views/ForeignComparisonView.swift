//
//  ForeignComparisonView.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/23/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class ForeignComparisonView: UIView {
	@IBOutlet weak var rootVerticalStackView: UIStackView!

	@IBOutlet weak var topHorizontalStackView: UIStackView!

	@IBOutlet weak var planetContainerView: UIView!
	@IBOutlet weak var planetDiameterLine: UIImageView!
	@IBOutlet weak var diameterLabe: UILabel!
	@IBOutlet weak var gravityLabel: UILabel!

	@IBOutlet weak var verticalStackStandardInfo: UIStackView!

	@IBOutlet weak var comaprisonLabel: UILabel!

	@IBOutlet weak var terrainStack: UIStackView!
	@IBOutlet weak var landscapeImage: UIImageView!
	@IBOutlet weak var landscapeLabel: UIStackView!


	@IBOutlet weak var populationStack: UIStackView!
	@IBOutlet weak var populationImage: UIImageView!
	@IBOutlet weak var populationLabel: UILabel!


	@IBOutlet weak var BottomHorizontalStack: UIStackView!

	@IBOutlet weak var earthEquivalenceStack: UIStackView!

	@IBOutlet weak var earthYearEquivalenceStack: UIStackView!
	@IBOutlet weak var earthYearEquivalenceImage: UIImageView!
	@IBOutlet weak var earthYearEquivalencelabel: UILabel!

	@IBOutlet weak var earthDayEquivalenceStack: UIStackView!
	@IBOutlet weak var earthDayEquivalenceImage: UIImageView!
	@IBOutlet weak var earthDayEquivalenceLabel: UILabel!

	@IBOutlet weak var conditionsStack: UIStackView!

	@IBOutlet weak var waterCoverageStack: UIStackView!
	@IBOutlet weak var waterCoverageImage: UIImageView!
	@IBOutlet weak var waterCoveragePercentLabel: UILabel!

	@IBOutlet weak var atmosphereStack: UIStackView!
	@IBOutlet weak var atmosphereImage: UIImageView!
	@IBOutlet weak var atmosphereLabel: UILabel!
}
