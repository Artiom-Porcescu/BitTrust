//
//  EmailView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.11.2023.
//

import SwiftUI

struct EmailView: View {
    
    var emailAddress = "artemporcesku@gmail.com"
    
    var body: some View {
        HStack {
            Image(systemName: "envelope.circle.fill")
                .font(.title)
                .foregroundStyle(.green)
            Button(action: {
                let emailURL = URL(string: "mailto:\(emailAddress)")
                if let emailURL = emailURL, UIApplication.shared.canOpenURL(emailURL) {
                    UIApplication.shared.open(emailURL)
                }
            }) {
                Text(emailAddress)
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    EmailView()
}
