//
//  TapticFeedback.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 16.11.2023.
//

import Foundation
import UIKit

struct TapticFeedback {
    static func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .rigid)
        generator.impactOccurred()
    }
}
