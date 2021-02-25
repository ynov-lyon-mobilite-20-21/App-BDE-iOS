//
//  SettingsView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/02/2021.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ViewProvider.event()) {
                    VStack(alignment: .leading) {
                        Text("Nicolas Barbosa")
                            .font(.title3)
                        Text(L10n.Settings.UpdateInfo.subTitle)
                            .font(.subheadline)
                    }
                    .padding(.vertical)
                }
                Spacer()
                Text(L10n.Settings.onboarding)            .font(.title3)
                    .padding(.vertical)
                NavigationLink(destination: ViewProvider.event()) {
                    Text(L10n.Settings.Payment.info)     .font(.title3)                    .padding(.vertical)
                }
                Text(L10n.Settings.Account.delete)        .font(.title3)                    .padding(.vertical)
                Text(L10n.Settings.Account.logout)            .font(.title3)
                    .padding(.vertical)
                    .foregroundColor(Color.bdePink)
            }
            .navigationBarTitle(L10n.Settings.title, displayMode: .automatic)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel())
    }
}
