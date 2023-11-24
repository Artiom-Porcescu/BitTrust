//
//  NewsView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = RequestNewsItemViewModel()
    @State private var isShowingSafariView = false
    @State private var selectedIndex: Int? 

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.news.indices, id: \.self) { index in
                    NewsRow(newsTitle: viewModel.news[index].title, currencies: viewModel.news[index].currencies).onTapGesture {
                            TapticFeedback.triggerHapticFeedback()
                            self.selectedIndex = index
                            self.isShowingSafariView = true
                        }
                    .contextMenu(ContextMenu(menuItems: {
                        ShareLink(item: "\(viewModel.news[index].newsURL)")
                    }))
                }
            }
            .refreshable {
                viewModel.fetchNews()
                TapticFeedback.triggerHapticFeedback()
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("News", displayMode: .large)
            .fullScreenCover(isPresented: $isShowingSafariView) {
                if let selectedIndex = selectedIndex, viewModel.news.indices.contains(selectedIndex) {
                    SafariView(url: URL(string: viewModel.news[selectedIndex].newsURL) ?? URL(string: "https://cryptopanic.com/")!)
                } else {
                    // Handle the error or show a default URL
                    SafariView(url: URL(string: "https://cryptopanic.com/")!)
                }
            }
        }
    }
}


#Preview {
    NewsView()
}
