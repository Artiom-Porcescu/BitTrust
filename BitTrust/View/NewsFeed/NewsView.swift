//
//  NewsView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 14.11.2023.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = RequestNewsItemViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NewsView()
}
