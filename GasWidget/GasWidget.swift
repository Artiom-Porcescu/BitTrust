//
//  GasWidget.swift
//  GasWidget
//
//  Created by Artiom Porcescu on 25.11.2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct GasWidgetEntryView : View {
    var entry: Provider.Entry
    var gasViewModel = RequestGasInfoViewModel()

    var body: some View {
        ZStack {
            
            VStack {
                HStack(spacing: 15) {
                    Text("⛽️")
                    Text("ETH Gas")
                    
                }.font(.custom("Menlo", size: 20))
                Spacer()
                Text("25")
                    .font(.custom("Menlo", size: 50))
                    .bold()
                Text("Gwei")
                    .font(.custom("Menlo", size: 20))
                    .bold()
                Spacer()
            }.foregroundStyle(.black)
            
        }
    }
}

struct GasWidget: Widget {
    let kind: String = "GasWidget"
    

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                GasWidgetEntryView(entry: entry)
                    .containerBackground(.white.gradient, for: .widget)
            } else {
                GasWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Gas Tracker Widget")
        .description("This is an example gas tracker widget.")
    }
}

#Preview(as: .systemSmall) {
    GasWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
}
