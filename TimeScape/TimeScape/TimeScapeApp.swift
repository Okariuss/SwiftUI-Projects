//
//  TimeScapeApp.swift
//  TimeScape
//
//  Created by Okan Orkun on 10.07.2025.
//

import SwiftUI

@main
struct TimeScapeApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
