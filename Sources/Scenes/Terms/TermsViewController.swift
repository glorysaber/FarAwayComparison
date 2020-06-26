//
//  TermsViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 1/29/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

// MARK: - TermsViewController

class TermsViewController: UIViewController {

  var userTappedOnAgree: (() -> Void)?
	var reloadData: (() -> Void)?
  
  // MARK: - IBoutlets
  @IBOutlet weak var termsTextView: UITextView!
  @IBOutlet weak var iAgreeButton: UIButton!
  
  // MARK: - View Events
  
  override func viewDidLoad() {
    super.viewDidLoad()


		reloadData?()
  }
  
  // MARK: - IBActions
  
  @IBAction func iAgreeButtonPressed() {
		userTappedOnAgree?()
  }
  
}

extension TermsViewController: TermsPresenterOutput {
	func present(terms: String) {
		termsTextView.text = terms
	}
}

extension TermsViewController: Storyboarded {
	static var storyboardName: String = "Terms"
}
