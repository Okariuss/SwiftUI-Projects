//
//  CoinImageViewModelTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 2.08.2025.
//

import Testing
@testable import Cryptoroid

struct CoinImageViewModelTests {
    
    @Test
    func test_imageLoadsAndIsLoadingStops() async throws {
        let coin = DeveloperPreview.instance.coin
        let vm = CoinImageViewModel(coin: coin)
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        #expect(vm.image != nil)
        #expect(vm.isLoading == false)
    }
}
