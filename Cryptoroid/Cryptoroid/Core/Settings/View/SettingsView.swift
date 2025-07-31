//
//  SettingsView.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 31.07.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    let defaultURL = URL(string: "https://www.google.com")!
    let githubURL = URL(string: "https://github.com/Okariuss/SwiftUI-Projects/tree/cryptoroid")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let projectsURL = URL(string: "https://github.com/Okariuss/SwiftUI-Projects")!
    let personelURL = URL(string: "https://github.com/Okariuss")!
    
    var body: some View {
        NavigationView {
            List {
                appSection
                coinGeckoSection
                developerSection
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    XMarkButton {
                        dismiss()
                    }
                }
            }
        }
    }
}

extension SettingsView {
    private var appSection: some View {
        Section(header: Text("SwiftUI-Projects")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by looking @SwiftfulThinking course on YouTube. It uses MVVM architecture, Combine, and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.accent)
            }
            .padding(.vertical)
            Link("See codes on", destination: githubURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that used in this app comes from a free API from CoinGecko! It is a great resource for learning about cryptocurrencies.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeckoURL)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Text("You can see the similar projects on my GitHub page! It is a great place to find more information about me!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.accent)
            }
            .padding(.vertical)
            Link("Visit SwiftUI Projects", destination: projectsURL)
            Link("Visit my GitHub page", destination: personelURL)
        }
    }
}

#Preview {
    SettingsView()
}
