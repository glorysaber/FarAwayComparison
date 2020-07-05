//
//  JSONDecoder.DateDecodingStrategy.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {

	enum DateError: Swift.Error {
		case invalidDate(String)
	}

	static var customISO8601: JSONDecoder.DateDecodingStrategy {
		JSONDecoder.DateDecodingStrategy.custom({ (decoder) -> Date in
			let container = try decoder.singleValueContainer()
			let iso8601String = try container.decode(String.self)

			let formatter = DateFormatter()
			formatter.calendar = Calendar(identifier: .iso8601)
			formatter.locale = Locale(identifier: "en_US_POSIX")
			formatter.timeZone = TimeZone(secondsFromGMT: 0)

			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
			if let date = formatter.date(from: iso8601String) {
				return date
			}
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
			if let date = formatter.date(from: iso8601String) {
				return date
			}
			throw DateError.invalidDate(iso8601String)
		})
	}
}
