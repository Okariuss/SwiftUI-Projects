//
//  LocationTests.swift
//  TimeScape
//
//  Created by Okan Orkun on 15.07.2025.
//

import Testing
import MapKit
@testable import TimeScape

struct LocationTests {
    
    @Test
    func test_locationID_IsConcatenationOfCountryAndCity() {
        let location = Location(name: "Anıtkabir", cityName: "Ankara", coordinates: CLLocationCoordinate2D(latitude: 0, longitude: 0), description: "", imageNames: [], link: "")
        #expect(location.id == "AnıtkabirAnkara")
    }
    
    @Test
    func test_locationEquatable_ReturnTrueForSameID() {
        let location1 = Location(name: "Anıtkabir", cityName: "Ankara", coordinates: CLLocationCoordinate2D(latitude: 5, longitude: 0), description: "This is for first city", imageNames: ["image_2"], link: "www.yandex.com")
        let location2 = Location(name: "Anıtkabir", cityName: "Ankara", coordinates: CLLocationCoordinate2D(latitude: 10, longitude: 10), description: "This is for second city", imageNames: ["image_1"], link: "www.google.com")
        #expect(location1 == location2)
    }
    
    @Test
    func test_locationEquatable_ReturnFalseForDifferentID() {
        let location1 = Location(name: "Kuğulu Park", cityName: "Ankara", coordinates: CLLocationCoordinate2D(latitude: 5, longitude: 0), description: "This is for first city", imageNames: ["image_2"], link: "www.yandex.com")
        let location2 = Location(name: "Anıtkabir", cityName: "Ankara", coordinates: CLLocationCoordinate2D(latitude: 10, longitude: 10), description: "This is for second city", imageNames: ["image_1"], link: "www.google.com")
        #expect(location1 != location2)
    }
}
