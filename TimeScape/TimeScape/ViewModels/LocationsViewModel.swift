//
//  LocationsViewModel.swift
//  TimeScape
//
//  Created by Okan Orkun on 12.07.2025.
//

import SwiftUI
import Foundation
import MapKit

final class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapCameraPosition: MapCameraPosition = .automatic
    private let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            ))
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            self.showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            return
        }
        
        // Check if the next index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is not valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
