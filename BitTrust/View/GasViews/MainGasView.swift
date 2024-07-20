//
//  MainGasView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI
import SwiftUICharts

struct MainGasView: View {
    
    @StateObject private var gasLevelsViewModel = GasInfoViewModel(service: CryptoDataService())
    @StateObject private var gasHistoryViewModel = RequestGasHistoryViewModel()
    
    private var timer: Timer?
    
    private let chartStyle = ChartStyle(backgroundColor: Color.white, accentColor: Color(.systemMint), gradientColor: GradientColor.init(start: Color.mint, end: Color(.systemMint)), textColor: Color.black, legendTextColor: Color(.systemMint), dropShadowColor: Color.white)
    
    var chartData: [(String, Double)] {
        var data: [(String, Double)] = []
        for item in gasHistoryViewModel.gasHistory.reversed() {
            data.append( (item.timestamp, Double(item.gasPrice)) )
        }
        return data
    }
    
    var body: some View {
        VStack {
            if let gwei = gasLevelsViewModel.gasItem {
                HStack() {
                    GasSquareItem(color: .red, gwei: gwei.result.fastGasPrice ?? "", type: "High")
                    Spacer()
                    GasSquareItem(color: .yellow, gwei: gwei.result.proposeGasPrice ?? "", type: "Average")
                }
                .padding()
                GasRectItem(color: .mint, gwei: gwei.result.safeGasPrice ?? "", type: "Low")
            }
            BarChartView(data: ChartData(values: chartData), title: "Gas History - Gwei",style: chartStyle, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "fuelpump.circle.fill"), valueSpecifier: "%.0f Gwei")
        }.onAppear {
            Task { await gasLevelsViewModel.fetchCoinDetails() }
            gasHistoryViewModel.startFetchingGas()
        }
        .onDisappear {
            gasHistoryViewModel.stopFetchingGas()
        }
        
    }
}

#Preview {
    MainGasView()
}
