//
//  FishingTrip.swift
//  FishingDiary
//
//  Created by Johannes Persson on 2025-08-04.
//

import Foundation
import CoreLocation

struct FishingTrip: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var startTime: Date
    var endTime: Date
    var lake: String
    var weather: String
    var method: String
    var participants: [String]
}
