//
//  GithubProjectView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.11.2023.
//

import SwiftUI

struct GithubProjectView: View {
    
    @State private var isShowingSafariProjView = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "star.circle.fill").renderingMode(.original)
                    .font(Font.system(size: 25))
                Text("Star Repository")
            }
            Spacer()
            Image(systemName: "arrow.forward.circle")
        }
        .onTapGesture {
            self.isShowingSafariProjView = true
        }
        .fullScreenCover(isPresented: $isShowingSafariProjView) {
            SafariView(url: URL(string: "https://github.com/Artiom-Porcescu/BitTrust")!)
        }
    }
}

#Preview {
    GithubProjectView()
}
