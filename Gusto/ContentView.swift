//
//  ContentView.swift
//  Gusto
//
//  Created by Brandon Johns on 5/6/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var restaurants: [Restaurant]
    @Environment(\.modelContext) var modelContext
    
    @State private var navPath = [Restaurant]()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            List {
                ForEach(restaurants) { restaurant in
                    NavigationLink(value: restaurant ){
                        VStack(alignment: .leading) {
                            Text(restaurant.name)
                            
                            HStack(spacing: 30) {
                                HStack {
                                    Image(systemName: "dollarsign.circle")
                                    Text(String(restaurant.priceRating))
                                }
                                
                                HStack {
                                    Image(systemName: "hand.thumbsup")
                                    Text(String(restaurant.qualityRating))
                                }
                                
                                HStack {
                                    Image(systemName: "bolt")
                                    Text(String(restaurant.speedRating))
                                }
                                
                                
                            }
                        }
                    }
                }
                .onDelete(perform: deleteRestaurants )
            }
            .navigationTitle("Gusto")
            .navigationDestination(for: Restaurant.self) { restaurant in
                EditRestaurantView(restaurant: restaurant)
            }
            .toolbar {
                Button("Add Samples", action: addSamples)
                Button(action: addNewRestaurant) {
                    Label("Add new restaurant" , systemImage: "plus")
                }
            }
        }
    }
    
    func addSamples() {
        let a = Restaurant(name: "Wok this Way", priceRating: 5, qualityRating: 4, speedRating: 3)
        let b = Restaurant(name: "Thyme Square", priceRating: 3, qualityRating: 4, speedRating: 2)
        let c = Restaurant(name: "Pasta la Vista", priceRating: 4, qualityRating: 4, speedRating: 2)
        let d = Restaurant(name: "Life of Pie", priceRating: 3, qualityRating: 4, speedRating: 5)
        let e = Restaurant(name: "Lord of the Wings", priceRating: 5, qualityRating: 2, speedRating: 5)
        
        modelContext.insert(a)
        modelContext.insert(b)
        modelContext.insert(c)
        modelContext.insert(d)
        modelContext.insert(e)
    }
    
    func deleteRestaurants( _ indexSet: IndexSet) {
        for item in indexSet {
            let object = restaurants[item]
            modelContext.delete(object)
        }
    }
    
    func addNewRestaurant() {
        let restaurant = Restaurant(name: "New Restaurant", priceRating: 3, qualityRating: 3, speedRating: 3)
        modelContext.insert(restaurant)
        
        navPath  = [restaurant]
    }
}

#Preview {
    ContentView()
}
