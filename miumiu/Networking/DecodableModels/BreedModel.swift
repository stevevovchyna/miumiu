//
//  BreedModel.swift
//  miumiu
//
//  Created by Steven Vovchyna on 18.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import Foundation

struct Breed: Codable {
    var id: String?
    var name: String?
    var temperament: String?
    var life_span: String?
    var alt_names: String?
    var wikipedia_url: String?
    var vcahospitals_url: String?
    var vetstreet_url: String?
    var origin: String?
    var weight: WeightType?
    var experimental: Int?
    var hairless: Int?
    var natural: Int?
    var rare: Int?
    var rex: Int?
    var suppressed_tail: Int?
    var short_legs: Int?
    var hypoallergenic: Int?
    var adaptability: Int?
    var affection_level: Int?
    var country_code: String?
    var country_codes: String?
    var child_friendly: Int?
    var dog_friendly: Int?
    var energy_level: Int?
    var grooming: Int?
    var health_issues: Int?
    var intelligence: Int?
    var shedding_level: Int?
    var social_needs: Int?
    var stranger_friendly: Int?
    var vocalisation: Int?
    var description: String?
}

struct WeightType: Codable {
    var imperial: String?
    var metric: String?
}
