//
//  CoinDetailDataServiceTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid
import Combine

struct CoinDetailDataServiceTests {

    @Test
    func test_coinDetails_InitiallyEmpty() async throws {
        let service = CoinDetailDataService(coin: DeveloperPreview.instance.coin)
        #expect(service.coinDetails == nil)
    }
    
    @Test func test_coin_setCoinForInit() async throws {
        let service = CoinDetailDataService(coin: DeveloperPreview.instance.coin)
        #expect(service.coin.id == DeveloperPreview.instance.coin.id)
    }

    @Test
    func test_coinDetails_PopulatedAfterFetch() async throws {
        let service = CoinDetailDataService(coin: DeveloperPreview.instance.coin)
        
        try await Task.sleep(nanoseconds: 2_000_000_000)
        
        #expect(service.coinDetails != nil)
    }
}
