//
//  SWAPIClientProduct.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation
import Alamofire

extension SWAPI {

	class Client: SWAPIClient {

		enum Error: Swift.Error {
			case bundleInfoNotFound(MainBundleInfo)
			case urlNotFound(url: String)
			case malformedResponse(String)
			case errorFromServer(String)
			case error(String)
			case pageDoesNotExist
		}

		func getNextPage<Resource: SWAPIResource>(from page: Page<Resource>, completion: @escaping (Result<Page<Resource>, Error>) -> Void) {
			guard let pageURL = page.next else {
				completion(.failure(.pageDoesNotExist))
				return
			}

			guard let url = URL(string: pageURL) else {
				completion(.failure(.urlNotFound(url: pageURL)))
				return
			}

			request(url, completion)
		}

		func getPrevPage<Resource: SWAPIResource>(from page: Page<Resource>, completion: @escaping (Result<Page<Resource>, Error>) -> Void) {
			guard let pageURL = page.previous else {
				completion(.failure(.pageDoesNotExist))
				return
			}

			guard let url = URL(string: pageURL) else {
				completion(.failure(.urlNotFound(url: pageURL)))
				return
			}

			request(url, completion)
		}

		func searchFor<Resource: SWAPIResource>(resource: Resource.Type = Resource.self, matching term: String, completion: @escaping (Result<Page<Resource>, Error>) -> Void) {
			guard let stringURL = MainBundleInfo.swApiUrl.getInfo() else {
				completion(.failure(.bundleInfoNotFound(.swApiUrl)))
				return
			}

			guard var url = URL(string: stringURL) else {
				completion(.failure(.urlNotFound(url: stringURL)))
				return
			}

			url.appendPathComponent(Resource.attribute.rawValue)

			var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
			urlComponents?.queryItems = [ URLQueryItem(name: "search", value: term)]
			guard let newURL = urlComponents?.url else {
				completion(.failure(Error.urlNotFound(url: stringURL)))
				return
			}

			url = newURL

			request(url, completion)
		}

		func requestAll<Resource: SWAPIResource>(of resource: Resource.Type = Resource.self, completion: @escaping (Result<Page<Resource>, Error>) -> Void) {
			guard let stringURL = MainBundleInfo.swApiUrl.getInfo() else {
				completion(.failure(.bundleInfoNotFound(.swApiUrl)))
				return
			}

			guard var url = URL(string: stringURL) else {
				completion(.failure(.urlNotFound(url: stringURL)))
				return
			}

			url.appendPathComponent(Resource.attribute.rawValue)

			request(url, completion)
		}

		func requestResource<Resource: SWAPIResource>(with id: Int, as format: Format = .json, resource: Resource.Type = Resource.self, completion: @escaping (Result<Resource, Error>) -> Void) {
			guard let stringURL = MainBundleInfo.swApiUrl.getInfo() else {
				completion(.failure(.bundleInfoNotFound(.swApiUrl)))
				return
			}

			guard var url = URL(string: stringURL) else {
				completion(.failure(.urlNotFound(url: stringURL)))
				return
			}

			url.appendPathComponent(Resource.attribute.rawValue)

			url.appendPathComponent(String(id))

			request(url, completion)
		}

		@discardableResult
		private func request<Resource: Decodable>(_ url: URL, _ completion: @escaping (Result<Resource, Error>) -> Void) -> DataRequest {
			AF.request(url, method: .get).responseData {  (dataResponse: DataResponse<Data, AFError>) in
				switch dataResponse.result {
				case let .success(data):
					let result: Resource
					do {
						let decoder = JSONDecoder()
						decoder.dateDecodingStrategy = .customISO8601
						result = try decoder.decode(Resource.self, from: data)
					} catch {
						completion(.failure(.malformedResponse(error.localizedDescription)))
						return
					}
					completion(.success(result))
				case let .failure(error):
					completion(.failure(.error(error.localizedDescription)))
				}
			}
		}
	}
}
