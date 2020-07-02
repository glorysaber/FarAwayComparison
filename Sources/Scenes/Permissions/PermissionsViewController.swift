//
//  PermissionsViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/12/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

// MARK: - PermissionsViewController
class PermissionsViewController: UIViewController {

	var allowPermissionsRequested: (() -> Void)?
	var reloadData: (() -> Void)?
  
  // MARK: - IBOutlets
  @IBOutlet weak var locationRequireExplanationLabel: UILabel!
  @IBOutlet weak var allowLocationButton: UIButton!
  
  // MARK: - View events
  override func viewDidLoad() {
    super.viewDidLoad()
		reloadData?()
  }
  
  // MARK: - IBActions
  
  @IBAction func allowLocationButtonPressed() {
		allowPermissionsRequested?()
  }

	func display(explanation: PermissionsExplanationViewModel) {
		locationRequireExplanationLabel.text = explanation.locationExplanation
		allowLocationButton.titleLabel?.text = explanation.locationButtonTitle
	}

}

extension PermissionsViewController: Storyboarded {
	static var storyboardName: String = "Permissions"
}
