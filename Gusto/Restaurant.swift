//
//  Restaurant.swift
//  Gusto
//
//  Created by Brandon Johns on 5/6/24.
//

import Foundation
import SwiftData

@Model
class Restaurant {
    @Attribute(.unique) var name: String
    var priceRating: Int
    var qualityRating: Int
    var speedRating: Int
    
    init(name: String, priceRating: Int, qualityRating: Int, speedRating: Int) {
        self.name = name
        self.priceRating = priceRating
        self.qualityRating = qualityRating
        self.speedRating = speedRating
    }
}
