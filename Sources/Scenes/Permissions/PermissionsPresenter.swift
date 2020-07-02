//
//  PermissionsPresenter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol PermissionsPresenterOutput {
	func display(_ model: PermissionsExplanationViewModel)
	func display(_ model: PermissionsAlertViewModel)
	func display(_ model: PermissionsGrantedViewModel)
}

class PermissionsPresenter {
	let output: PermissionsPresenterOutput

	init(output: PermissionsPresenterOutput) {
		self.output = output
	}

	func start() {
		let explanation = getLocalizedString(for: .locationExplanation, comment: "The explanation for the location permissions")
		let buttonTitle = getLocalizedString(for: .locatonButtonTitle, comment: "The buttons title")

		let model = PermissionsExplanationViewModel(locationExplanation: explanation, locationButtonTitle: buttonTitle)

		output.display(model)
	}

	func didGetLocationPermissions() {
		output.display(PermissionsGrantedViewModel())
	}

	func doesNotHaveLocationPermissions() {
		let explanation = getLocalizedString(for: .failedToGetLocPermissions, comment: "Explaning next steps")
		let buttonTitle = getLocalizedString(for: .failedToGetLocPermButtonTitle, comment: "Explaning next steps")
		let model = PermissionsAlertViewModel(explanation: explanation, buttonTitle: buttonTitle)
		output.display(model)
	}

}

private extension PermissionsPresenter {

	func getLocalizedString(for localizationString: LocalizedString, comment: String) -> String {
		NSLocalizedString(localizationString.rawValue, tableName: "Permissions", comment: comment)
	}

	enum LocalizedString: String {
		case locatonButtonTitle = "location button title"
		case locationExplanation = "location permission explanataion"
		case failedToGetLocPermissions = "failedToGetLocPermissions"
		case failedToGetLocPermButtonTitle = "failedToGetLocPermButtonTitle"
	}
}
