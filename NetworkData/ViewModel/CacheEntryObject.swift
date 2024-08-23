//
//  CacheEntryObject.swift
//  NetworkData
//
//  Created by Luciano Nicolini on 22/08/2024.
//

import Foundation

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}


enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
