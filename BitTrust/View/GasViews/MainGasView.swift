//
//  MainGasView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct MainGasView: View {
    
    @StateObject var viewModel = RequestGasInfoViewModel()
    
    var body: some View {
        VStack {
            HStack() {
                GasSquareItem(color: .high, gwei: viewModel.highGas)
                Spacer()
                GasSquareItem(color: .average, gwei: viewModel.averageGas)
            }
            .padding()
            GasRectItem(gasLevel: .low, gwei: viewModel.lowGas)
        }
    }
}

#Preview {
    MainGasView()
}
