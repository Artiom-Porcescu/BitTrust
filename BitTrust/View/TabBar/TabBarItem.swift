//
//  TabBarItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct TabBarItem: View {
    
    @State private var animate = false
    
    var body: some View {
        Button {
            animate.toggle()
        } label: {
            VStack {
                Image(systemName: "house.fill").symbolEffect(.bounce, value: animate).font(.title)
                Text("Toggle").font(.system(size: 13))
            }.foregroundColor(Color(GasLevel.low.rawValue))
        }
    }
}

#Preview {
    TabBarItem()
}
