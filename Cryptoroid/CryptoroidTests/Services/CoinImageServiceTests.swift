//
//  CoinImageServiceTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid
import UIKit

struct CoinImageServiceTests {

    @Test
    func test_image_InitiallyEmpty() async throws {
        let service = CoinImageService(coin: DeveloperPreview.instance.coin)
        #expect(service.image == nil)
    }

    @Test
    func test_image_SetImageForInit() async throws {
        let service = CoinImageService(coin: DeveloperPreview.instance.coin)
        try await Task.sleep(nanoseconds: 2_000_000_000)
        #expect(service.image != nil)
    }
    
    @Test
    func test_image_LoadedFromCacheIfAvailable() async throws {
        let coin = DeveloperPreview.instance.coin
        let image = UIImage(systemName: "bitcoinsign.circle")!
        let fileManager = LocalFileManager.instance
        fileManager.saveImage(image: image, imageName: coin.id, folderName: "Cryptoroid_Images")
        
        let service = CoinImageService(coin: coin)
        
        try await Task.sleep(nanoseconds: 500_000_000)
        
        #expect(service.image != nil)
    }
}
