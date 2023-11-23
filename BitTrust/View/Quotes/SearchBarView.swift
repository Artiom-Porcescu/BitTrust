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
    @State private var quotes: [QuoteItem] = []
    
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
                    .autocorrectionDisabled()
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
                    QuoteResultRectView(ticker: viewModel.quote.ticker, price: viewModel.quote.price, onAdd: {
                        self.addItem(QuoteItem(ticker: viewModel.quote.ticker, price: viewModel.quote.price))
                    }, added: true)
                    .transition(.scale)
                }
                
                if quotes.isEmpty {
                    Spacer()
                    EmptyQuotesView()
                    Spacer()
                } else {
                    ScrollView {
                        ForEach($quotes) { $quote in
                            QuoteResultRectView(ticker: quote.ticker, price: quote.price, onDelete: {
                                self.deleteItem(quote)
                            }, added: false)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
    private func addItem(_ item: QuoteItem) {
        isShowingQuoteResult = false
        quotes.append(item)
    }
    
    private func deleteItem(_ item: QuoteItem) {
        if let index = quotes.firstIndex(where: { $0.id == item.id }) {
            quotes.remove(at: index)
        }
    }
}

#Preview {
    SearchBarView()
}
