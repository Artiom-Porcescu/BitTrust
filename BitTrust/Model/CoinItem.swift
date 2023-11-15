//
//  CoinItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import Foundation

enum CoinItem: String, CaseIterable {
    case bitcoin
    case ethereum
    case arbitrum
    case optimism
    case solana
}

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}
