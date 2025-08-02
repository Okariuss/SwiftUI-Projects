//
//  DetailViewModelTests.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 2.08.2025.
//

import Testing
@testable import Cryptoroid

struct DetailViewModelTests {
    
    @Test
    func test_statisticsAndLinks_loadedCorrectly() async throws {
        let coin = DeveloperPreview.instance.coin
        let vm = DetailViewModel(coin: coin)
        
        try await Task.sleep(nanoseconds: 6_000_000_000)
        
        #expect(!vm.overviewStatistics.isEmpty)
        #expect(!vm.additionalStatistics.isEmpty)
        
        #expect(vm.coinDescription != nil)
        #expect(vm.websiteURL != nil)
        #expect(vm.redditURL != nil)
    }
}
