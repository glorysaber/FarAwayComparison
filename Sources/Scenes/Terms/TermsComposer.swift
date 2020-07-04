//
//  TermsComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class TermsComposer {
	func composeTerms(activity: RoutingActivity) -> TermsViewController {
		let vc = TermsViewController.instantiate()
		let presenter = TermsPresenter(output: WeakRef(vc))
		let useCase = FetchTermsTextUseCase(output: presenter)
		let router = TermsRouter(vc, activity: activity)

		vc.reloadData = useCase.fetch
		vc.userTappedOnAgree = router.routeToPermissions
		return vc
	}
}
