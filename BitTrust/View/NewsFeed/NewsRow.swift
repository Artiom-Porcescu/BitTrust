//
//  NewsRow.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct NewsRow: View {
    
    var newsTitle: String
    //var currencies: [String] later on add the logic to get currecnies from array
    @State private var animate = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "newspaper.fill")
                    .foregroundColor(.black)
                    .font(.system(size: 50))
                    .symbolEffect(.bounce, value: animate).font(.title)
                VStack(alignment: .leading) {
                        Text(newsTitle)
                        .fontWeight(.bold)
                        Text("Currencies: ")
                }
                .font(.custom("Futura", size: 15))
                Spacer()
            }
        }
        
    }
}

#Preview {
    NewsRow(newsTitle: "New Title")
}
