//
//  ShareView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.11.2023.
//

import SwiftUI

struct ShareView: View {
    
    @State private var showingLinkAlert = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "square.and.arrow.up.circle.fill").foregroundStyle(.red)
                    .font(Font.system(size: 25))
                Text("Share the App")
            }
            Spacer()
            Image(systemName: "arrow.forward.circle")
        }
        .onTapGesture {
            self.showingLinkAlert = true
            let urlObject = URL(string: "https://github.com/Artiom-Porcescu/BitTrust")
            UIPasteboard.general.url = urlObject
            
        }
        .alert("Link copied to clipboard", isPresented: $showingLinkAlert) {
            Button("OK") { }
        }
    }
}

#Preview {
    ShareView()
}
