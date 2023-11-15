//
//  MainGasView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI
import Charts

struct MainGasView: View {
    
    @StateObject var viewModel = RequestGasInfoViewModel()
    
    var data: [ToyShape] = [
        .init(type: "Cube", count: 5),
        .init(type: "Sphere", count: 4),
        .init(type: "Pyramid", count: 4),
        .init(type: "Pyramid2", count: 4),
        .init(type: "Pyramid3", count: 4),
        .init(type: "Pyramid4", count: 4),
        .init(type: "Pyramid5", count: 4),
        .init(type: "Pyramid6", count: 4)
    ]
    
    var body: some View {
        VStack {
            HStack() {
                GasSquareItem(color: .high, gwei: viewModel.highGas)
                Spacer()
                GasSquareItem(color: .average, gwei: viewModel.averageGas)
            }
            .padding()
            GasRectItem(gasLevel: .low, gwei: viewModel.lowGas)
            
            Chart {
                ForEach(data.indices, id: \.self) { index in
                    BarMark(
                        x: .value("Shape Type", data[index].type),
                        y: .value("Total Count", data[index].count)
                    )
                }
            }
        }
    }
}

#Preview {
    MainGasView()
}
