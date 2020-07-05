//
//  SWAPIClientProduct.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation
import Alamofire

class SWAPIClientProduct: SWAPIClient {

	enum Error: Swift.Error {
		case bundleInfoNotFound(MainBundleInfo)
		case urlNotFound(url: String)
		case malformedResponse(String)
		case errorFromServer(String)
		case error(String)
	}

	func requestResource<Resource: SWAPIResource>(with id: Int, as format: SWAPI.Format = .json, resource: Resource.Type = Resource.self, completion: @escaping (Result<Resource, Error>) -> Void) {
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
