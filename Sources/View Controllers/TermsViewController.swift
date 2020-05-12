//
//  TermsViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 1/29/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

// MARK: - TermsViewController -

class TermsViewController: UIViewController {
  
  static let storyboardID = String(describing: TermsViewController.self)
  
  // MARK: - IBoutlets
  @IBOutlet weak var termsTextView: UITextView!
  @IBOutlet weak var iAgreeButton: UIButton!
  
  // MARK: - View Events
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // MARK: - IBActions
  
  @IBAction func iAgreeButtonPressed(_ sender: UIButton) {
    
  }
  
}

