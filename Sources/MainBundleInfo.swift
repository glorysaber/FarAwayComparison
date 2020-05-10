//
//  MainBundleInfo.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 2/16/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

enum MainBundleInfo: String {
  case weatherBitApiKey = "WeatherbitApiKey"
  case weatherBitApiUrl = "WeatherbitApiUrl"
  case swApiUrl = "SWApiUrl"

  func getInfo() -> String? {
    return (Bundle.main.infoDictionary?[self.rawValue] as? String)?
             .replacingOccurrences(of: "\\", with: "")
  }
}



