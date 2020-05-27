//
//  Storyboarded.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 5/27/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

protocol Storyboarded {
	static var storyboardName: String { get }
	static var storyboardID: String { get }
	static var storyboardBundle: Bundle { get }

	static func instantiate(creator: ((NSCoder) -> Self?)?) -> Self
}

extension Storyboarded where Self: UIViewController {
	static var storyboardName: String { "Main" }

	static var storyboardBundle: Bundle { Bundle.main }

	static var storyboardID: String { String(describing: self) }

	static func instantiate(creator: ((NSCoder) -> Self?)? = nil ) -> Self {
		let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)

		guard let viewController =
			storyboard.instantiateViewController(
				identifier: storyboardID,
				creator: creator as ((NSCoder) -> UIViewController?)?) as? Self
			else {
			fatalError("Did not get back expected type: \(Self.debugDescription())")
		}

		return viewController
	}
}
