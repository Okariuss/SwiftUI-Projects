//
//  HomeViewModelTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 2.08.2025.
//

import Testing
@testable import Cryptoroid

struct HomeViewModelTests {

    @Test
    func test_Coins_FilterBySearchText() async throws {
        let vm = DeveloperPreview.instance.homeVM
        let coin = DeveloperPreview.instance.coin
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        vm.searchedText = coin.name.prefix(3).uppercased()
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        #expect(vm.allCoins.contains(where: { $0.id == coin.id }))
    }

    @Test
    func test_Coins_SortOptionUpdates_ByRankReversed() async throws {
        let vm = DeveloperPreview.instance.homeVM
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        let initial = vm.allCoins
        vm.sortOption = .rankReversed
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        let updated = vm.allCoins
        #expect(initial.first?.id == updated.last?.id)
    }
    
    @Test
    func test_Coins_SortOptionUpdates_ByPrice() async throws {
        let vm = DeveloperPreview.instance.homeVM
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        vm.sortOption = .price
        try await Task.sleep(nanoseconds: 1_000_000_000)
        let initial = vm.allCoins
        
        vm.sortOption = .priceReversed
        try await Task.sleep(nanoseconds: 1_000_000_000)
        let updated = vm.allCoins
        
        #expect(initial.first?.currentPrice == updated.last?.currentPrice)
    }
    
    @Test
    func test_PortfolioCoins_FilledWithRandomCoins() async throws {
        let vm = DeveloperPreview.instance.homeVM

        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        clearAllPortfolio()

        let randomCoins = vm.allCoins.shuffled().prefix(3)

        for coin in randomCoins {
            let randomAmount = Double(Int.random(in: 1...10))
            vm.updatePortfolio(coin: coin, amount: randomAmount)
        }

        try await Task.sleep(nanoseconds: 2_000_000_000)

        #expect(vm.portfolioCoins.count == 3)
        #expect(vm.portfolioCoins.allSatisfy { $0.currentHoldings != nil && $0.currentHoldings! > 0 })
    }
    
    @Test
    func test_PortfolioCoins_SortOptionUpdates_ByHoldings() async throws {
        let vm = DeveloperPreview.instance.homeVM
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        vm.sortOption = .holdings
        try await Task.sleep(nanoseconds: 1_000_000_000)
        let initial = vm.portfolioCoins
        
        vm.sortOption = .holdingsReversed
        try await Task.sleep(nanoseconds: 1_000_000_000)
        let updated = vm.portfolioCoins
        
        #expect(initial.first?.currentPrice == updated.last?.currentPrice)
    }
    
    @Test
    func test_PortfolioCoins_RemovePortfolioCoins_WhenAmountIsZero() async throws {
        let vm = DeveloperPreview.instance.homeVM
        vm.portfolioCoins.forEach {
            vm.updatePortfolio(coin: $0, amount: 0)
        }
        
        #expect(vm.portfolioCoins.isEmpty)
    }
    
    @Test
    func test_ReloadData_SetsIsLoading() async throws {
        let vm = DeveloperPreview.instance.homeVM
        
        vm.reloadData()
        
        #expect(vm.isLoading)
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        #expect(!vm.isLoading)
    }
    
    @Test
    func test_Statistics_GeneratedAfterDataArrives() async throws {
        let vm = DeveloperPreview.instance.homeVM
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        #expect(!vm.statistics.isEmpty)
    }
    
    private func clearAllPortfolio() {
        let vm = DeveloperPreview.instance.homeVM
        vm.portfolioCoins.forEach {
            vm.updatePortfolio(coin: $0, amount: 0)
        }
    }
}
