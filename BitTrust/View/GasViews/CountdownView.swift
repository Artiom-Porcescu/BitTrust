//
//  CountdownView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 23.11.2023.
//

import SwiftUI

struct CountdownView: View {
    @State private var timeRemaining = ""
    let targetDate: Date

    init() {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        var components = DateComponents()
        components.year = 2024
        components.month = 4
        components.day = 19
        components.hour = 23
        components.minute = 19
        components.second = 18
        targetDate = calendar.date(from: components)!
        updateRemainingTime()
    }

    var body: some View {
        Text(timeRemaining)
            .font(.custom("Menlo", size: 17))
            .foregroundStyle(.orange)
            .bold()
            .onAppear(perform: setupTimer)
    }

    private func updateRemainingTime() {
        let now = Date()
        let remainingSeconds = targetDate.timeIntervalSince(now)
        
        if remainingSeconds > 0 {
            timeRemaining = formatTimeInterval(remainingSeconds)
        } else {
            timeRemaining = "Countdown finished"
        }
    }

    private func formatTimeInterval(_ interval: TimeInterval) -> String {
        let days = Int(interval) / 86400
        let hours = Int(interval) / 3600 % 24
        let minutes = Int(interval) / 60 % 60
        let seconds = Int(interval) % 60
        return String(format: "BTC Halving in %02id %02ih %02im %02is", days, hours, minutes, seconds)
    }

    private func setupTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            updateRemainingTime()
        }
    }
}


#Preview {
    CountdownView()
}
