//
//  AddressView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.11.2023.
//

import SwiftUI

struct AddressView: View {
    
    @State private var showingAddressAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Copy ERC20 Adrress")
                .padding(.bottom, 5)
            Text("0x38567c8ab9F21551Af9713e45102869A1bba375b").font(.caption).foregroundStyle(.secondary)
        }
        .onTapGesture {
            self.showingAddressAlert = true
            let addressString = "0x38567c8ab9F21551Af9713e45102869A1bba375b"
            UIPasteboard.general.string = addressString
        }
        .alert("Address copied to clipboard", isPresented: $showingAddressAlert) {
            Button("OK") { }
        }
    }
}

#Preview {
    AddressView()
}
