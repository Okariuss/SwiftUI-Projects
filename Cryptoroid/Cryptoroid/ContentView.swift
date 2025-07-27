//
//  ContentView.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 27.07.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Accent Color")
                    .foregroundStyle(.accent)
                
                Text("Secondary Text Color")
                    .foregroundStyle(.secondary)
                
                Text("Red Color")
                    .foregroundStyle(.red)
                
                Text("Green Color")
                    .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
