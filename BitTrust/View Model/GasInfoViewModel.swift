//
//  GasInfoViewModel.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.07.2024.
//

import Foundation

class GasInfoViewModel: ObservableObject {
    private let service: CryptoServiceProtocol
    
    @Published var gasItem: GasItem?
    
    init(service: CryptoServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func fetchCoinDetails() async {
        do {
            self.gasItem = try await service.fetchGasInfo()
            print("Gas item: \(self.gasItem)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
