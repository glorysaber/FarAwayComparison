//
//  TermsRouterTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 7/3/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class TermsRouterTests: XCTestCase {

	func test_doesNotCrash_routing() {
		let window = UIWindow()
		let viewController = UIViewController()
		window.rootViewController = viewController

		let sut = TermsRouter(viewController, activity: RoutingActivity() {}, container: AppContainer() )

		sut.routeToPermissions()
	}

}
