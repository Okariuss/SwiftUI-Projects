//
//  PortfolioDataServiceTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid

struct PortfolioDataServiceTests {

    @Test func test_savedEntities_InitiallyEmpty() async throws {
        let service = PortfolioDataService()
        #expect(service.savedEntities.isEmpty)
    }

    @Test
    func test_addCoinEntity() async throws {
        let service = PortfolioDataService()
        let coin = DeveloperPreview.instance.coin

        service.updatePortfolio(coin: coin, amount: 10)

        try await Task.sleep(nanoseconds: 500_000_000)

        #expect(service.savedEntities.contains(where: { $0.coinID == coin.id && $0.amount == 10 }))
    }

    @Test
    func test_updateCoinEntityAmount() async throws {
        let service = PortfolioDataService()
        let coin = DeveloperPreview.instance.coin

        service.updatePortfolio(coin: coin, amount: 10)
        service.updatePortfolio(coin: coin, amount: 20)

        try await Task.sleep(nanoseconds: 500_000_000)

        #expect(service.savedEntities.contains(where: { $0.coinID == coin.id && $0.amount == 20 }))
    }

    @Test
    func test_deleteCoinEntityWhenAmountZero() async throws {
        let service = PortfolioDataService()
        let coin = DeveloperPreview.instance.coin

        service.updatePortfolio(coin: coin, amount: 10)
        service.updatePortfolio(coin: coin, amount: 0)

        try await Task.sleep(nanoseconds: 500_000_000)

        #expect(service.savedEntities.isEmpty)
    }

}
