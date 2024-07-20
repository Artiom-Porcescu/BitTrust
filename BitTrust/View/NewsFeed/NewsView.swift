//
//  NewsView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var viewModel = NewsViewModel(service: CryptoDataService())
    @State private var isShowingSafariView = false
    @State private var selectedIndex: Int?

    var body: some View {
        NavigationView {
            List {
                if let news = viewModel.news {
                    ForEach(news.results.indices, id: \.self) { index in
                        NewsRow(newsTitle: news.results[index].title, currencies: news.results[index].currencies ?? [])
                            .onTapGesture {
                                TapticFeedback.triggerHapticFeedback()
                                self.selectedIndex = index
                                self.isShowingSafariView = true
                            }
                            .contextMenu {
                                ShareLink(item: news.results[index].url)
                            }
                    }
                }
            }
            .refreshable {
                TapticFeedback.triggerHapticFeedback()
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("News", displayMode: .large)
            .fullScreenCover(isPresented: $isShowingSafariView) {
                if let selectedIndex = selectedIndex, let news = viewModel.news, news.results.indices.contains(selectedIndex) {
                    SafariView(url: URL(string: news.results[selectedIndex].url) ?? URL(string: "https://cryptopanic.com/")!)
                } else {
                    SafariView(url: URL(string: "https://cryptopanic.com/")!)
                }
            }
            .onAppear {
                Task { await viewModel.fetchCoinDetails() }
            }
        }
    }
}
