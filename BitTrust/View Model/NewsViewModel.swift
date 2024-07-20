//
//  NewsViewModel.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.07.2024.
//

import Foundation

class NewsViewModel: ObservableObject {
    private let service: CryptoServiceProtocol
    
    @Published var news: NewsItem?
    
    init(service: CryptoServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func fetchCoinDetails() async {
        do {
            self.news = try await service.fetchNews()
            print("News in view model \(self.news)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
    }
}

