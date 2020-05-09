//
//  Utilities.swift
//  miumiu
//
//  Created by Steven Vovchyna on 03.05.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

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

func presentErrorAlertIn(_ controller: UIViewController, with message: String, handler: ((UIAlertAction) -> Void)? = nil) {
    DispatchQueue.main.async {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: handler)
        alert.addAction(okAction)
        controller.present(
            alert,
            animated: true,
            completion: nil)
    }
}
