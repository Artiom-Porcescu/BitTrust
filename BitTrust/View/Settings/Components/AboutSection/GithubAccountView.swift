//
//  GithubAccountView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.11.2023.
//

import SwiftUI

struct GithubAccountView: View {
    
    @State private var isShowingSafariGitView = false
    
    var body: some View {
        HStack {
            HStack {
                Image("github").resizable()
                    .frame(width: 25, height: 25)
                Text("Artiom-Porcescu")
            }
            Spacer()
            Image(systemName: "arrow.forward.circle")
            
        }
        .onTapGesture {
            self.isShowingSafariGitView = true
        }
        .fullScreenCover(isPresented: $isShowingSafariGitView) {
            SafariView(url: URL(string: "https://github.com/Artiom-Porcescu")!)
        }
        .padding(.leading, 2)
    }
}

#Preview {
    GithubAccountView()
}
