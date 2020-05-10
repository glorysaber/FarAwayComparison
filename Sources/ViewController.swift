//
//  ViewController.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 1/29/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func buttonPressed(_ sender: UIButton) {
    
    guard let label = label else {
      return;
    }
    
    label.text =  String((Int(label.text ?? "0") ?? 0) + 1);
  }
  
}

