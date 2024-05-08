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
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
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
            .navigationTitle("Gusto")
            .toolbar {
                Button("Add Samples", action: addSamples)
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
}

#Preview {
    ContentView()
}
