//
//  EmptyQuotesView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 15.11.2023.
//

import SwiftUI

struct EmptyQuotesView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.magnifyingglass")
                .font(.system(size: 200))
            Text("Empty Quote List")
                .font(.custom("Futura", size: 25))
        }.foregroundColor(.gray)
        
    }
}

#Preview {
    EmptyQuotesView()
}
