//
//  MainGasView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI
import SwiftUICharts

struct MainGasView: View {
    
    @StateObject private var gasLevelsViewModel = RequestGasInfoViewModel()
    @StateObject private var gasHistoryViewModel = RequestGasHistoryViewModel()
    
    private var timer: Timer?
    
    private let chartStyle = ChartStyle(backgroundColor: Color.white, accentColor: Color(GasLevel.low.rawValue), gradientColor: GradientColor.init(start: Color.mint, end: Color(GasLevel.low.rawValue)), textColor: Color.black, legendTextColor: Color(GasLevel.low.rawValue), dropShadowColor: Color.white)
    
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
            
            BarChartView(data: ChartData(values: chartData), title: "Gas History - Gwei",style: chartStyle, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "fuelpump.circle.fill"), valueSpecifier: "%.0f Gwei")
        }.onAppear {
            gasLevelsViewModel.startFetchingGas()
            gasHistoryViewModel.startFetchingGas()
        }
        .onDisappear {
            gasLevelsViewModel.stopFetchingGas()
            gasHistoryViewModel.stopFetchingGas()
        }
        
    }
}

#Preview {
    MainGasView()
}
