//
//  LogFishingTripView.swift
//  FishingDiary
//
//  Created by Johannes Persson on 2025-08-04.
//

import SwiftUI

struct LogFishingTripView: View {
    @State private var trip = FishingTrip(
        date: Date(),
        startTime: Date(),
        endTime: Date(),
        lake: "",
        weather: "",
        method: "",
        participants: []
    )
    @State private var participantText = ""

    var body: some View {
        Form {
            DatePicker("Datum", selection: $trip.date, displayedComponents: .date)
            DatePicker("Starttid", selection: $trip.startTime, displayedComponents: .hourAndMinute)
            DatePicker("Sluttid", selection: $trip.endTime, displayedComponents: .hourAndMinute)
            TextField("Sjö", text: $trip.lake)
            TextField("Väder", text: $trip.weather)
            TextField("Fiskemetod", text: $trip.method)
            HStack {
                TextField("Lägg till deltagare", text: $participantText)
                Button("Lägg till") {
                    trip.participants.append(participantText)
                    participantText = ""
                }
            }
            if !trip.participants.isEmpty {
                ForEach(trip.participants, id: \.self) {
                    Text($0)
                }
            }

            Button("Spara tur") {
                // Lägg till spara-funktion här (lokalt)
                var existing = FishingTripStorage.load()
                    existing.append(trip)
                    FishingTripStorage.save(trips: existing)
            }
        }
    }
}

#Preview {
    LogFishingTripView()
}
