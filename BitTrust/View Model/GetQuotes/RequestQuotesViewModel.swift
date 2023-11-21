//
//  RequestQuotesViewModel.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 16.11.2023.
//

import Foundation

final class RequestQuotesViewModel {
    
    @Published var price: Double = 0.0
    @Published var ticker: String = ""
    
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
                self.ticker = json["asset_id_base"] as! String
                self.price = json["rate"] as! Double
                completion()
            }
            
        }.resume()
    }
}
