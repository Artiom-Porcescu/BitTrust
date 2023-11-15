//
//  NewsRow.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct NewsRow: View {
    
    var newsTitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "newspaper.fill")
                .foregroundColor(.black)
                .font(.title)
        }
    }
}

#Preview {
    NewsRow(newsTitle: "New Title")
}
