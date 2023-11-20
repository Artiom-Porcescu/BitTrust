//
//  PhoneView.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 20.11.2023.
//

import SwiftUI

struct PhoneView: View {
    
    var phoneNumber = "+37368635063"
    
    var body: some View {
        HStack {
            Image(systemName: "phone.circle.fill").renderingMode(.original)
                .font(Font.system(size: 25))
            Link(destination: URL(string: "tel://\(phoneNumber)")!) {
                Text(phoneNumber)
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    PhoneView()
}
