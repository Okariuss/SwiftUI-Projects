//
//  CryptoroidApp.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 27.07.2025.
//

import SwiftUI

@main
struct CryptoroidApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbarVisibility(.hidden, for: .navigationBar)
            }
        }
    }
}
