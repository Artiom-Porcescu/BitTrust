//
//  RequestVM.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import Foundation

open class RequestGasInfoViewModel: ObservableObject {
    
    @Published var lowGas = ""
    @Published var averageGas = ""
    @Published var highGas = ""
    
    private var timer: Timer?
    
    func startFetchingGas() {
        fetchGas()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            print("Fetched gas")
            self?.fetchGas()
        }
    }
    
    func stopFetchingGas() {
        print("Stopped fetching gas")
        timer?.invalidate()
        timer = nil
    }
    
    func fetchGas() {
        let urlString = "https://api.etherscan.io/api?module=gastracker&action=gasoracle&apikey=DFV7AYR336P9BN9DQ5IGCDAH1JB66S9AVW"
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
            guard let result = json["result"] as? [String: Any] else { return }
            
            DispatchQueue.main.async {
                self.lowGas = result["SafeGasPrice"] as! String
                self.averageGas = result["ProposeGasPrice"] as! String
                self.highGas = result["FastGasPrice"] as! String
            }
            
        }.resume()
    }
    
}
