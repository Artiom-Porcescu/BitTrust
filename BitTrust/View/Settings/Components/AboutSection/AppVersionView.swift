//
//  AppVersionView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.11.2023.
//

import SwiftUI

struct AppVersionView: View {
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "gear.circle.fill").renderingMode(.original)
                    .font(Font.system(size: 25))
                Text("App Version")
            }
            Spacer()
            Text("1.0")
        }
    }
}

#Preview {
    AppVersionView()
}
