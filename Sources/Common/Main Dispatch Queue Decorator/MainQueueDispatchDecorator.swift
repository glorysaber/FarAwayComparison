//
//  MainQueueDispatchDecorator.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/1/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

final class MainQueueDispatchDecorator<T> {
	private let decoratee: T

	init(decoratee: T) {
		self.decoratee = decoratee
	}

	func dispatch(completion: @escaping () -> Void) {
		guard Thread.isMainThread else {
			return DispatchQueue.main.async(execute: completion)
		}

		completion()
	}
}
