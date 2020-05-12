//
//  TermsViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 1/29/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
  
  static let storyboardID = String(describing: TermsViewController.self)
  
  @IBOutlet weak var termsTextView: UITextView!
  @IBOutlet weak var iAgreeButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func iAgreeButtonPressed(_ sender: UIButton) {
    
  }
  
}

