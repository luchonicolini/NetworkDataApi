//
//  QuakesProvider.swift
//  NetworkData
//
//  Created by Luciano Nicolini on 22/08/2024.
//

import Foundation

@MainActor
class QuakesProvider: ObservableObject {

    @Published var quakes: [Quake] = []

    let client: QuakeClient
    
    func location(for quake: Quake) async throws -> QuakeLocation {
         let quakeData = try await client.downloadQuakeData(for: quake)
         return try JSONDecoder().decode(QuakeLocation.self, from: quakeData)
     }
    
    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }

    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }

    init(client: QuakeClient = QuakeClient(downloader: URLSession.shared)) {
            self.client = client
        }
}
