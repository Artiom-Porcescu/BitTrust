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
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            
            // Settings tab
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }.tint(GasLevel.low.color)
        
    }
}

#Preview {
    MainView()
}
