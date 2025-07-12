//
//  LocationsView.swift
//  TimeScape
//
//  Created by Okan Orkun on 12.07.2025.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List(vm.locations) { location in
            Text(location.name)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
