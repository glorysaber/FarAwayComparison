//
//  SWAPIAdapter.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 8/8/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

class SWAPIAdapter {
	private var swapiCache = SWAPICache<SWAPI.Planet>()
	private let swapiClient: SWAPIClient
	
	init(swapiClient: SWAPIClient) {
		self.swapiClient = swapiClient
	}
	
	private func cacheNextAvailablePage(completion: ((Result<[SWAPI.Planet], Error>) -> Void)? = nil) {
		let completion = { [weak self] (response: Result<SWAPI.Page<SWAPI.Planet>, SWAPI.Error>) in
			switch response {
			case let .success(planetPage):
				self?.swapiCache.append(planetPage)
				completion?(.success(planetPage.results))

			case .failure(let error):
				completion?(.failure(error))
			}
		}

		if swapiCache.isEmpty {
			swapiClient.requestAll(of: SWAPI.Planet.self, completion: completion)
		} else if let lastPage = swapiCache.last, lastPage.next != nil {
			swapiClient.getNextPage(from: lastPage, completion: completion)
		}
	}
	
	func makeIteratorForCachedData() -> AnyIterator<SWAPI.Page<SWAPI.Planet>> {
		AnyIterator<SWAPI.Page<SWAPI.Planet>>(swapiCache.makeIterator())
	}
	
	func makeIteratorForCachedResources() -> AnyIterator<SWAPI.Planet> {
		AnyIterator<SWAPI.Planet>(swapiCache.makeResourceIterator())
	}
}

extension SWAPIAdapter: PlanetDataSource {	
	func requestNewPlanetData(completion: ((Result<[SWAPI.Planet], Error>) -> Void)? = nil) {
		cacheNextAvailablePage(completion: completion)
	}
	
	func makeIterator() -> AnyIterator<SWAPI.Planet> {
		makeIteratorForCachedResources()
	}
	
	func canGetNewData() -> Bool {
		swapiCache.last?.next != nil
	}
}
