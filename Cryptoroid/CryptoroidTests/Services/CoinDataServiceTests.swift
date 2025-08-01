//
//  CoinDataServiceTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid
import Combine

struct CoinDataServiceTests {

    @Test
    func test_allCoins_InitiallyEmpty() async throws {
        let service = CoinDataService()
        #expect(service.allCoins.isEmpty)
    }

    @Test
    func test_allCoins_PopulatedAfterFetch() async throws {
        let service = CoinDataService()
        
        try await Task.sleep(nanoseconds: 2_000_000_000)
        
        #expect(!service.allCoins.isEmpty)
    }
}
