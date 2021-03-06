//
//  WeakRef+TermsPresenterOutput.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension WeakRef: TermsPresenterOutput where T: TermsPresenterOutput {
	func present(terms: String) {
		object?.present(terms: terms)
	}
}
