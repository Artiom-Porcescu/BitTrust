//
//  CryptoDataService.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.07.2024.
//

import Foundation

protocol CryptoServiceProtocol {
    func fetchNews() async throws -> NewsItem
    func fetchGasInfo() async throws -> GasItem
}

class CryptoDataService: CryptoServiceProtocol, HTTPDataDownloader {
    
    // MARK: I know that API keys should not be stored openly like that, it's just fro testing it
    let newsURL: String? = "https://cryptopanic.com/api/v1/posts/?auth_token=b47ebdd1b4464aa269f2c28991aa959038486c8e"
    let gasURL: String? = "https://api.etherscan.io/api?module=gastracker&action=gasoracle&apikey=DFV7AYR336P9BN9DQ5IGCDAH1JB66S9AVW"
    
    func fetchNews() async throws -> NewsItem {
        
        guard let endpoint = newsURL else {
            throw CryptoAPIError.requestFailed(description: "Endpoint failed")
        }
        let data = try await fetchData(as: NewsItem.self, endpoint: endpoint)
        print("Data : \(data)")
        return data
    }
    
    func fetchGasInfo() async throws -> GasItem {
        guard let endpoint = gasURL else {
            throw CryptoAPIError.requestFailed(description: "Endpoint failed")
        }
        let data = try await fetchData(as: GasItem.self, endpoint: endpoint)
        print("Data : \(data)")
        return data
    }

}

