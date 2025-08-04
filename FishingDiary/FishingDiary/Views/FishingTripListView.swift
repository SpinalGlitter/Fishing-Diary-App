//
//  FishingTripListView.swift
//  FishingDiary
//
//  Created by Johannes Persson on 2025-08-04.
//

import Foundation
import SwiftUI

struct FishingTripListView: View {
    @State private var trips = FishingTripStorage.load()

    var body: some View {
        NavigationView {
            List(trips) { trip in
                VStack(alignment: .leading) {
                    Text(trip.lake)
                    Text(trip.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Mina fisketurer")
        }
    }
}

#Preview {
    FishingTripListView()
}
