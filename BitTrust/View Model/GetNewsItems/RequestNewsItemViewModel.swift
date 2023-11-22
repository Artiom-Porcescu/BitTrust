//
//  RequestNewsItemViewModel.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import Foundation

final class RequestNewsItemViewModel: ObservableObject {
    
    @Published var news: [NewsItem] = []
    
    
    private var timer: Timer?
    
    init() {
        fetchNews()
        timer = Timer.scheduledTimer(withTimeInterval: 300.0, repeats: true) { [weak self] _ in
            self?.fetchNews()
        }
    }
    
    func fetchNews() {
        
        news = []
        
        let urlString = "https://cryptopanic.com/api/v1/posts/?auth_token=b47ebdd1b4464aa269f2c28991aa959038486c8e"
        guard let url = URL(string: urlString) else {
            print("Error while setting URL string")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print("Error while getting data for URL session")
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            guard let res = json["results"] as? [[String: Any]] else { return }
            
            for elem in res {
                DispatchQueue.main.async {
                    if let title = elem["title"] as? String, let newsURL = elem["url"] as? String {
                        
                        var currencies: [String] = []
                        
                        if let currenciesCodes = elem["currencies"] as? [[String: Any]] {
                            for currency in currenciesCodes {
                                if let currencyCode = currency["code"] as? String {
                                    currencies.append(currencyCode)
                                }
                            }
                        } 
                        
                        
                        self.news.append(NewsItem(title: title, newsURL: newsURL, currencies: currencies))
                    }
                }
            }
        }.resume()
    }
    
    deinit {
        timer?.invalidate()
    }
}
