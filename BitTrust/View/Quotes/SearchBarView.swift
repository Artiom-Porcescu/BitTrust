//
//  SearchBarView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 15.11.2023.
//

import SwiftUI

struct SearchBarView: View {
    @State private var name: String = ""
    @State private var isShowingQuoteResult = false
    @State var viewModel = RequestQuotesViewModel()
    @State private var quotes: [QuoteResultRectView] = []
    
    var body: some View {
        ZStack {
            
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    if self.isShowingQuoteResult {
                        TapticFeedback.triggerHapticFeedback()
                    }
                    withAnimation {
                        self.isShowingQuoteResult = false
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            VStack {
                TextField("Enter ticker name e.g. BTC -> submit", text: $name)
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
                    QuoteResultRectView(ticker: viewModel.quote.ticker, price: viewModel.quote.price)
                        .transition(.scale)
                }
                Spacer()
                EmptyQuotesView()
                Spacer()
            }
        }
        
    }
}

#Preview {
    SearchBarView()
}
