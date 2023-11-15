//
//  RequestNewsItemViewModel.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import Foundation

final class RequestNewsItemViewModel: ObservableObject {
    
    @Published var titles: [String] = []
    @Published var newsURLs: [String] = []
    
    private var timer: Timer?
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
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
            print("New data: \(data)")
            
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            guard let res = json["results"] as? [[String: Any]] else { return }
            
            for elem in res {
                DispatchQueue.main.async {
                    self.titles.append(elem["title"] as! String)
                    self.newsURLs.append(elem["url"] as! String)
                    print("titles Array: \(self.titles)")
                    print("newsURL array: \(self.newsURLs)")
                    print("\n\n\n\n\n\n\n\n")
                }
            }
            
            
            
        }.resume()
    }
    
    deinit {
        timer?.invalidate()
    }
}
