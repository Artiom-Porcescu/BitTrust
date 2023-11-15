//
//  ContentView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI
import Charts

struct MainView: View {
    
    var body: some View {
        TabView {
            MainGasView().tabItem {
                Image(systemName: "house.fill")
                Text("Main")
            }
            
            // News tab
            NewsView() // Replace with actual content for the news tab
                .tabItem {
                    Image(systemName: "newspaper.fill") // Icon for the news tab
                    Text("News")
                }
            
            // Quotes tab
            Text("Quotes Content") // Replace with actual content for the quotes tab
                .tabItem {
                    Image(systemName: "chart.bar.xaxis") // Icon for the quotes tab
                    Text("Quotes")
                }
            
            Text("Alarms") // Replace with actual content for the settings tab
                .tabItem {
                    Image(systemName: "bell") // Icon for the settings tab
                    Text("Alarms")
                }
            
            // Settings tab
            Text("Settings Content") // Replace with actual content for the settings tab
                .tabItem {
                    Image(systemName: "gearshape.fill") // Icon for the settings tab
                    Text("Settings")
                }
        }.tint(GasLevel.low.color)
        
    }
}

#Preview {
    MainView()
}
