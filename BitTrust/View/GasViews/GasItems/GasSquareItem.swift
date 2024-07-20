//
//  GasSquareItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct GasSquareItem: View {
    
    let color: Color
    let gwei: String
    let type: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(color)
                .frame(width: 150, height: 150)
                .overlay {
                    VStack {
                        Text("\(gwei) GWEI")
                            .padding()
                        Text(type)
                    }
                    .font(.custom("Menlo", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                }
                    
        }
        
    }
}

#Preview {
    GasSquareItem(color: .low, gwei: "35", type: "Low")
}
