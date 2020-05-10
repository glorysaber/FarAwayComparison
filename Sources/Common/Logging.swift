//
//  Logging.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 2/16/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

func log(_ items: Any...) {
  #if DEBUG
  debugPrint(items)
  #else
  print(items)
  #endif
}
