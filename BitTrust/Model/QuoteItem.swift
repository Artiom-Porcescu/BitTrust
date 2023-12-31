//
//  QuoteItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 22.11.2023.
//

import Foundation

struct QuoteItem: Identifiable {
    let id = UUID()
    var ticker: String
    var price: Double
}
