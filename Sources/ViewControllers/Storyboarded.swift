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
	static var instantiationRequiresCreator: Bool { get }

	static func instantiate(creator: ((NSCoder) -> Self?)?) -> Self

}

extension Storyboarded {
	static var storyboardName: String { "Main" }

	static var storyboardBundle: Bundle { Bundle.main }

	static var storyboardID: String { String(describing: self) }

	static var instantiationRequiresCreator: Bool { false }
}

extension Storyboarded where Self: UIViewController {

	static func instantiate(creator: ((NSCoder) -> Self?)? = nil ) -> Self {
		guard instantiationRequiresCreator == false || creator != nil else {
			fatalError("Creator is required for instantiation")
		}

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
