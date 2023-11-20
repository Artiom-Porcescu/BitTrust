import SwiftUI
import UIKit

struct SettingsView: View {
    
    var emailAddress = "artemporcesku@gmail.com"
    var phoneNumber = "+37368635063"
    @State private var isShowingSafariGitView = false
    @State private var isShowingSafariProjView = false
    @State private var showingLinkAlert = false
    @State private var showingAddressAlert = false
    
    var body: some View {
        List {
            Section(header: Text("About")) {
                
                
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
                
                
                HStack {
                    Image(systemName: "phone.circle.fill").renderingMode(.original)
                        .font(Font.system(size: 25))
                    Link(destination: URL(string: "tel://\(phoneNumber)")!) {
                        Text(phoneNumber)
                            .foregroundColor(.green)
                    }
                }
                
                
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
            
            
            Section(header: Text("Support Developer")) {
                VStack(alignment: .leading) {
                    Text("Copy ERC20 Adrress")
                        .padding(.bottom, 5)
                    Text("0x38567c8ab9F21551Af9713e45102869A1bba375b").font(.caption).foregroundStyle(.secondary)
                }
                .onTapGesture {
                    self.showingAddressAlert = true
                    let addressString = "0x38567c8ab9F21551Af9713e45102869A1bba375b"
                    UIPasteboard.general.string = addressString
                }
                .alert("Address copied to clipboard", isPresented: $showingAddressAlert) {
                    Button("OK") { }
                }
            }
        }
    }
}

struct AboutListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
