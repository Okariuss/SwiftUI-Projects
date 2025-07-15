//
//  LocationsViewModelTests.swift
//  TimeScape
//
//  Created by Okan Orkun on 15.07.2025.
//

import Testing
@testable import TimeScape

struct LocationsViewModelTests {
    
    @Test
    func test_init_shouldSetFirstLocation() {
        let vm = LocationsViewModel()
        #expect(vm.mapLocation == vm.locations.first)
    }
    
    @Test
    func test_toggleLocationsList_shouldToggleVisibility() {
        let vm = LocationsViewModel()
        vm.toggleLocationsList()
        #expect(vm.showLocationsList)
        vm.toggleLocationsList()
        #expect(!vm.showLocationsList)
    }
    
    @Test
    func test_toggleLocationsList_shouldToggleBackToFalse() {
        let vm = LocationsViewModel()
        vm.toggleLocationsList()
        vm.toggleLocationsList()
        #expect(!vm.showLocationsList)
    }
    
    @Test
    func test_showNextLocation_shouldSetCorrectLocationAndHideList() {
        let vm = LocationsViewModel()
        let newLocation = vm.locations[1]
        vm.showNextLocation(location: newLocation)
        #expect(vm.mapLocation == newLocation)
        #expect(!vm.showLocationsList)
    }
    
    @Test
    func test_nextButtonPressed_shouldMoveToNextLocation() {
        let vm = LocationsViewModel()
        let current = vm.mapLocation
        let currentIndex = vm.locations.firstIndex(of: current)!
        vm.nextButtonPressed()
        let expectedIndex = (currentIndex + 1) % vm.locations.count
        #expect(vm.mapLocation == vm.locations[expectedIndex])
    }
    
    @Test
    func test_nextButtonPressed_shouldWrapToFirstLocationWhenAtEnd() {
        let vm = LocationsViewModel()
        let last = vm.locations.last, first = vm.locations.first
        vm.showNextLocation(location: last!)
        vm.nextButtonPressed()
        #expect(vm.mapLocation == first!)
    }
    
    @Test
    func test_mapLocation_didSet_shouldUpdateMapRegion() {
        let vm = LocationsViewModel()
        let newLocation = vm.locations[1]
        vm.mapLocation = newLocation
        
        guard let region = vm.mapCameraPosition.region else { return }
        
        #expect(region.center.latitude == newLocation.coordinates.latitude)
        #expect(region.center.longitude == newLocation.coordinates.longitude)
    }
}
