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
  
  static let storyboardID = String(describing: TermsViewController.self)
  
  // MARK: - IBOutlets
  @IBOutlet weak var explanationLabel: UILabel!
  @IBOutlet weak var allowLocationButton: UIButton!
  
  // MARK: - View events
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  // MARK: - IBActions
  
  @IBAction func allowLocationButtonPressed(_ sender: UIButton) {
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
