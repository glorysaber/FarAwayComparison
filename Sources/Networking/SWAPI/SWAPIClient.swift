//
//  SWAPIClient.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol SWAPIClient {
	associatedtype Error: Swift.Error

	func requestResource<Resource: SWAPIResource>(with id: Int, as format: SWAPI.Format, resource: Resource.Type, completion: @escaping (Result<Resource, Error>) -> Void)
}
