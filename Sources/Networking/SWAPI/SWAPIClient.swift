//
//  SWAPIClient.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

protocol SWAPIClient {
	typealias Error = SWAPI.Error

	func getNextPage<Resource: SWAPIResource>(from page: SWAPI.Page<Resource>, completion: @escaping (Result<SWAPI.Page<Resource>, Error>) -> Void)
	func getPrevPage<Resource: SWAPIResource>(from page: SWAPI.Page<Resource>, completion: @escaping (Result<SWAPI.Page<Resource>, Error>) -> Void)
	func searchFor<Resource: SWAPIResource>(resource: Resource.Type, matching term: String, completion: @escaping (Result<SWAPI.Page<Resource>, Error>) -> Void)
	func requestAll<Resource: SWAPIResource>(of resource: Resource.Type, completion: @escaping (Result<SWAPI.Page<Resource>, Error>) -> Void)
	func requestResource<Resource: SWAPIResource>(with id: Int, as format: SWAPI.Format, resource: Resource.Type, completion: @escaping (Result<Resource, Error>) -> Void)
}
