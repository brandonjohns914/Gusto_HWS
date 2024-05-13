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
    var name: String
    var priceRating: Int
    var qualityRating: Int
    var speedRating: Int
    
    var totalRating: Double {
        Double(priceRating + qualityRating + speedRating) / 3
    }
    
    init(name: String, priceRating: Int, qualityRating: Int, speedRating: Int) {
        self.name = name
        self.priceRating = priceRating
        self.qualityRating = qualityRating
        self.speedRating = speedRating
    }
}
