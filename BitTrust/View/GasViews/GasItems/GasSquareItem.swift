//
//  GasSquareItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct GasSquareItem: View {
    
    var color: GasLevel
    var gwei: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(color.rawValue))
                    .frame(width: 150, height: 150)
                    .overlay {
                        VStack {
                            Text("\(gwei) GWEI")
                                .padding()
                            Text(color.rawValue)
                        }
                        .font(.custom("Futura", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    }
                    
        }
        
    }
}

#Preview {
    GasSquareItem(color: .low, gwei: "35")
}
