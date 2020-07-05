//
//  WeatherBit+Language.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/4/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

extension WeatherBit {
	/// Possible languages for weather
	enum Language: String, Codable {
		case english = "en"
		case arabic = "ar"
		case azerbaijani = "az"
		case belarusian = "be"
		case bulgarian = "bg"
		case bosnian = "bs"
		case catalan = "ca"
		case czech = "cz"
		case danish = "da"
		case german = "de"
		case finnish = "fi"
		case french = "fr"
		case greek = "el"
		case estonian = "et"
		case croatian = "hr"
		case hungarian = "hu"
		case indonesian = "id"
		case italian = "it"
		case icelandic = "is"
		case cornish = "kw"
		case lithuanian = "lt"
		case norwegianBokmål = "nb"
		case dutch = "nl"
		case polish = "pl"
		case portuguese = "pt"
		case romanian = "ro"
		case russian = "ru"
		case slovak = "sk"
		case slovenian = "sl"
		case serbian = "sr"
		case swedish = "sv"
		case turkish = "tr"
		case ukrainian = "uk"
		case chineseSimplified = "zh"
		case chineseTraditional = "zh-tw"
	}
}
