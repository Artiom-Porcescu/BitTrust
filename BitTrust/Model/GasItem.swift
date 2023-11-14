//
//  GasItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import Foundation
import SwiftUI

enum GasLevel: String {
    case low = "Low"
    case average = "Average"
    case high = "High"
    
    var color: Color {
        switch self{
        case .low:
            return Color("Low")
        case .average:
            return Color("Average")
        case .high:
            return Color("High")
        }
    }
}
