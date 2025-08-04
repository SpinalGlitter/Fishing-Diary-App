//
//  FishingTripStorage.swift
//  FishingDiary
//
//  Created by Johannes Persson on 2025-08-04.
//

import Foundation

struct FishingTripStorage {
    static let filename = "fishingTrips.json"
    
    // Spara
    static func save(trips: [FishingTrip]) {
        let url = getFileURL()
        do {
            let data = try JSONEncoder().encode(trips)
            try data.write(to: url)
            print("Sparat till: \(url)")
        } catch {
            print("Fel vid sparning: \(error)")
        }
    }
    
    // Läs
    static func load() -> [FishingTrip] {
        let url = getFileURL()
        do {
            let data = try Data(contentsOf: url)
            let trips = try JSONDecoder().decode([FishingTrip].self, from: data)
            return trips
        } catch {
            print("Fel vid läsning: \(error)")
            return []
        }
    }
    
    // Hjälpmetod: var filen sparas
    private static func getFileURL() -> URL {
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent(filename)
    }
}

