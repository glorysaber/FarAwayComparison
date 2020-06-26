//
//  FetchTermsTextUseCase.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol FetchTermsTextUseCaseOutput {
	func didFetch(_ terms: String)
}

final class FetchTermsTextUseCase {
	let output: FetchTermsTextUseCaseOutput

	init(output: FetchTermsTextUseCaseOutput) {
		self.output = output
	}

	func fetch() {
		let termsString = NSLocalizedString("terms", tableName: "Terms", bundle: .main, value: "", comment: "")
		output.didFetch(termsString)
	}
}
