//
//  TermsComposer.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class TermsComposure {
	func composeTerms() -> TermsViewController {
		let vc = TermsViewController.instantiate()
		let presenter = TermsPresenter(output: vc)
		let useCase = FetchTermsTextUseCase(output: presenter)
		vc.reloadData = useCase.fetch
		return vc
	}
}
