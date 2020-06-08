//
//  PermissionsViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/12/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

protocol PermissionsViewControllerDelegate: class {

	func permissionsViewControllerPermissionsGranted()
}

// MARK: - PermissionsViewController
class PermissionsViewController: UIViewController {

	weak var delegate: PermissionsViewControllerDelegate?
  
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
		delegate?.permissionsViewControllerPermissionsGranted()
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

extension PermissionsViewController: Storyboarded {
	static var storyboardName: String = "Permissions"
}
