//
//  GasItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import Foundation

// MARK: - Coin
struct GasItem: Codable {
    let result: Result2
}

// MARK: - Result
struct Result2: Codable {
    let safeGasPrice, proposeGasPrice, fastGasPrice: String?

    enum CodingKeys: String, CodingKey {
        case safeGasPrice = "SafeGasPrice"
        case proposeGasPrice = "ProposeGasPrice"
        case fastGasPrice = "FastGasPrice"
    }
}
