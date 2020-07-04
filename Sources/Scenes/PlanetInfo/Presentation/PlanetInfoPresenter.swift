//
//  PlanetInfoPresenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class PlanetInfoPresenter {

	let view: PlanetInfoView

	init(view: PlanetInfoView) {
		self.view = view
	}

	func didGetUpdatedComparison(info: PlanetInfoViewModel) {
		view.display(viewModel: info)
	}

}
