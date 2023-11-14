//
//  GasSquareItem.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct GasSquareItem: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                    .frame(width: 150, height: 150)
            VStack {
                Text("36 GWEI")
                Text("High")
            }
            .font(.custom("Futura", size: 25))
            .foregroundColor(.black)
        }
        .shadow(color: Color(GasLevel.low.rawValue), radius: 25)
    }
}

#Preview {
    GasSquareItem()
}
