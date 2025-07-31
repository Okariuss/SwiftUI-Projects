//
//  CryptoroidApp.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 27.07.2025.
//

import SwiftUI

@main
struct CryptoroidApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                NavigationStack {
                    HomeView()
                        .toolbarVisibility(.hidden, for: .navigationBar)
                }
                .environmentObject(vm)
                
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
            
        }
    }
}
