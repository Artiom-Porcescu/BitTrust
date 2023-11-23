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
    var onAdd: ( ()->Void )?
    var onDelete: ( ()->Void )?
    @State var added: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.green)
                .frame(height: 100)
            HStack {
                Text(ticker)
                Spacer()
                Text(String(format: "%.2f", price))
                if added {
                    Button {
                        onAdd!()
                        TapticFeedback.triggerHapticFeedback()
                        animate.toggle()
                        added.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .symbolEffect(.bounce, value: animate).font(.title)
                    }
                } else {
                    Button {
                        onDelete!()
                        TapticFeedback.triggerHapticFeedback()
                        animate.toggle()
                        added.toggle()
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .symbolEffect(.bounce, value: animate).font(.title)
                    }
                }
                
            }.font(.custom("Futura", size: 25))
                .foregroundColor(.white)
                .padding()
        }.padding(.horizontal, 20)
        
    }
}

//#Preview {
//    QuoteResultRectView()
//}
