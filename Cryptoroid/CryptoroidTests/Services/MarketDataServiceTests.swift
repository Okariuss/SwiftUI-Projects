//
//  MarketDataServiceTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid
import Combine

struct MarketDataServiceTests {

    @Test
    func test_marketData_InitiallyEmpty() async throws {
        let service = MarketDataService()
        #expect(service.marketData == nil)
    }

    @Test
    func test_marketData_PopulatedAfterFetch() async throws {
        let service = MarketDataService()
        
        try await Task.sleep(nanoseconds: 2_000_000_000)
        
        #expect(service.marketData != nil)
    }
}
