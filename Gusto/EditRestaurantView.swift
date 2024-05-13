//
//  EditRestaurantView.swift
//  Gusto
//
//  Created by Brandon Johns on 5/13/24.
//

import SwiftData
import SwiftUI

struct EditRestaurantView: View {
    @Bindable var restaurant: Restaurant
    var body: some View {
        Form {
            TextField("Name of restaurant", text: $restaurant.name )
            
            Section("Ratings") {
                Picker("Price", selection: $restaurant.priceRating){
                    ForEach(0..<6) { i in
                            Text(String(i))
                    }
                }
                
                Picker("Quality", selection: $restaurant.qualityRating){
                    ForEach(0..<6) { i in
                            Text(String(i))
                    }
                }
                
                Picker("Speed", selection: $restaurant.speedRating){
                    ForEach(0..<6) { i in
                            Text(String(i))
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Restaurant.self, configurations: config)
        
        let restaurant = Restaurant(name: "Bun Voyage", priceRating: 1, qualityRating: 2, speedRating: 3)
        return EditRestaurantView(restaurant: restaurant)
            .modelContainer(container)
    } catch {
        return Text("Failed to create a model container")
    }
}
