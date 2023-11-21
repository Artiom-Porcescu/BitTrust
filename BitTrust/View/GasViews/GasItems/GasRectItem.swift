//
//  GasRectItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct GasRectItem: View {
    
    var gasLevel: GasLevel
    var gwei: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(gasLevel.rawValue))
                    .frame(height: 150)
                    .overlay {
                        VStack {
                            Text("\(gwei) GWEI")
                                .padding()
                            Text(gasLevel.rawValue)
                        }
                        .font(.custom("Futura", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    }
                    .padding()
                    .shadow(color: .gray, radius: 10)  
        }
    }
}

#Preview {
    GasRectItem(gasLevel: .low, gwei: "35")
}
