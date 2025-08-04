//
//  FishingDiaryApp.swift
//  FishingDiary
//
//  Created by Johannes Persson on 2025-08-03.
//

import SwiftUI

@main
struct FishingDiaryApp: App {
    var body: some Scene {
        WindowGroup {
            LogFishingTripView()
            FishingTripListView()
        }
    }
}
