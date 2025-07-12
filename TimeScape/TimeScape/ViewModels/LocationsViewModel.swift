//
//  LocationsViewModel.swift
//  TimeScape
//
//  Created by Okan Orkun on 12.07.2025.
//

import Foundation

final class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        self.locations = LocationsDataService.locations
    }
}
