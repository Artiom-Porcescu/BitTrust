import SwiftUI
import UIKit

struct SettingsView: View {
    
    var body: some View {
        List {
            // About Section
            Section(header: Text("About")) {
                EmailView()
                PhoneView()
                GithubAccountView()
                GithubProjectView()
                ShareView()
                AppVersionView()
            }
            
            // Support Developer Section
            Section(header: Text("Support Developer")) {
                AddressView()
            }
            
        }
    }
}

struct AboutListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
