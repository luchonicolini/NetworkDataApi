//
//  NetworkDataApp.swift
//  NetworkData
//
//  Created by Luciano Nicolini on 22/08/2024.
//

import SwiftUI

@main
struct NetworkDataApp: App {
    @StateObject var quakesProvider = QuakesProvider()
    var body: some Scene {
        WindowGroup {
            Quakes()
                .environmentObject(quakesProvider)
        }
    }
}
