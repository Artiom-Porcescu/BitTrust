//
//  RequestQuotesViewModel.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 16.11.2023.
//

import Foundation

final class RequestQuotesViewModel {
    
    @Published var quote: QuoteItem = QuoteItem(ticker: "BTC", price: 27000.8)
    
    func fetchQuotes(for ticker: String, completion: @escaping () -> Void) {
        let urlString = "https://rest.coinapi.io/v1/exchangerate/\(ticker)/USD?apikey=313C55BD-312F-4CAE-A62A-C4C595216AFF"
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
            print("Quote json object: \(json)")
            
            DispatchQueue.main.async {
                if let ticker = json["asset_id_base"] as? String, let price = json["rate"] as? Double {
                    self.quote = QuoteItem(ticker: ticker, price: price)
                    completion()
                }
                
            }
            
        }.resume()
    }
}
