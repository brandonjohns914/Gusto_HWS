//
//  GustoApp.swift
//  Gusto
//
//  Created by Brandon Johns on 5/6/24.
//

import SwiftData
import SwiftUI

@main
struct GustoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Restaurant.self)
    }
}
