//
//  WeakRef.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/26/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

struct WeakRef<T: AnyObject> {
	weak var object: T?

	init(_ object: T) {
		self.object = object
	}
}
