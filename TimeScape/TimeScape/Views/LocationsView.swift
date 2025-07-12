//
//  LocationsView.swift
//  TimeScape
//
//  Created by Okan Orkun on 12.07.2025.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapCameraPosition)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
