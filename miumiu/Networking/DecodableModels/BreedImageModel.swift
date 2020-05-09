//
//  BreedImageModel.swift
//  miumiu
//
//  Created by Steven Vovchyna on 18.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import Foundation

struct BreedImage: Codable {
    var breeds: [Breed]?
    var id: String?
    var url: String?
    var width: Int?
    var height: Int?
}
