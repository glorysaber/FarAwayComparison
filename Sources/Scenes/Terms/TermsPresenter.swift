//
//  TermsPresenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol TermsPresenterOutput {
	func present(terms: String)
}

class TermsPresenter: FetchTermsTextUseCaseOutput {

	let output: TermsPresenterOutput

	init(output: TermsPresenterOutput) {
		self.output = output
	}

	func didFetch(_ terms: String) {
		output.present(terms: terms)
	}
}
