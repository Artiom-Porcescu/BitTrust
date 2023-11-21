//
//  MainGasView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI
import SwiftUICharts

struct MainGasView: View {
    
    @StateObject var gasLevelsViewModel = RequestGasInfoViewModel()
    @StateObject var gasHistoryViewModel = RequestGasHistoryViewModel()
    
    var chartData: [(String, Double)] {
        var data: [(String, Double)] = []
        for item in gasHistoryViewModel.gasHistory.reversed() {
            data.append( (item.timestamp, Double(item.gasPrice)) )
        }
        return data
    }
    
    var body: some View {
        VStack {
            HStack() {
                GasSquareItem(color: .high, gwei: gasLevelsViewModel.highGas)
                Spacer()
                GasSquareItem(color: .average, gwei: gasLevelsViewModel.averageGas)
            }
            .padding()
            GasRectItem(gasLevel: .low, gwei: gasLevelsViewModel.lowGas)
            
            BarChartView(data: ChartData(values: chartData), title: "Gas History - Gwei", form: ChartForm.extraLarge)
        }
    }
}

#Preview {
    MainGasView()
}
