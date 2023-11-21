//
//  QuoteResultRectView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 15.11.2023.
//

import SwiftUI
import UIKit

struct QuoteResultRectView: View {
    
    @State private var animate = false
    var ticker = ""
    var price = 0.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.green)
                .frame(height: 100)
            HStack {
                Text(ticker)
                Spacer()
                Text(String(format: "%.2f", price))
                Button {
                    TapticFeedback.triggerHapticFeedback()
                    animate.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .symbolEffect(.bounce, value: animate).font(.title)
                }
            }.font(.custom("Futura", size: 25))
                .foregroundColor(.white)
                .padding()
        }.padding(.horizontal, 20)
        
    }
}

#Preview {
    QuoteResultRectView()
}
