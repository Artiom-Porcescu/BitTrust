//
//  TextFieldView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.11.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var name: String = ""
    @State var viewModel = RequestQuotesViewModel()
    @State private var isShowingQuoteResult = false
    
    var body: some View {
        TextField("Enter ticker name e.g. BTC then submit", text: $name)
            .padding()
            .frame(height: 50)
            .overlay {
                RoundedRectangle(cornerRadius: 25).stroke(Color.green, lineWidth: 2)
            }.padding()
            .onSubmit {
                TapticFeedback.triggerHapticFeedback()
                viewModel.fetchQuotes(for: name.capitalized) {
                    withAnimation {
                        self.isShowingQuoteResult = true
                    }
                }
            }
        
        if isShowingQuoteResult {
            QuoteResultRectView(ticker: viewModel.ticker, price: viewModel.price)
                .transition(.scale)
        }
    }
}

#Preview {
    TextFieldView()
}
