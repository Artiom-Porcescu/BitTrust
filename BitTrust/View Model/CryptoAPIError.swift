//
//  CryptoAPIError.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.07.2024.
//

import Foundation

enum CryptoAPIError:Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData:
            return "Invalid data"
        case .jsonParsingFailure:
            return "Failed to parse JSON"
        case .requestFailed(let description):
            return "Request failed \(description)"
        case .invalidStatusCode(let statusCode):
            return "Ivalid status code \(statusCode)"
        case .unknownError(let error):
            return "Unknown error occured \(error.localizedDescription)"
        }
    }
}
