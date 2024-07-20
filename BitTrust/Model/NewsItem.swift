//
//  NewsItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import Foundation

struct NewsItem: Codable, Identifiable {
    let id = UUID()
    let results: [Result]
}

struct Result: Codable, Hashable {
    let title: String
    let currencies: [Currency]?
    let url: String

    enum CodingKeys: String, CodingKey {
        case title, currencies, url
    }
}

// MARK: - Currency
struct Currency: Codable, Hashable {
    let code: String
}
