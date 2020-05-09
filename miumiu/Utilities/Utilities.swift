//
//  Utilities.swift
//  miumiu
//
//  Created by Steven Vovchyna on 03.05.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import Foundation

func countryName(countryCode: String) -> String? {
    let current = Locale(identifier: "en_US")
    return current.localizedString(forRegionCode: countryCode)
}

func getFlagEmojiFromCountryCode(country: String) -> String {
    let base : UInt32 = 127397
    var s = ""
    for v in country.unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return country == "SP" ? "🇸🇬" : String(s)
}
