//
//  PlanetInfoComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class PlanetInfoComposer {

	func compose(appContainer: AppContainer) -> PlanetInfoViewController {
		let vc = PlanetInfoViewController.instantiate()

		let presenter = PlanetInfoPresenter(view: WeakRef(vc))

		let service = PlanetComparisonService(mainModel: appContainer.model, onComparisonUpdate: presenter.didGetUpdatedComparison)

		vc.refreshData = service.getCurrentComparison

		return vc
	}
}

extension WeakRef: PlanetInfoView where T: PlanetInfoView {
	func display(viewModel: PlanetInfoViewModel) {
		object?.display(viewModel: viewModel)
	}
}
