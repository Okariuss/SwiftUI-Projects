//
//  LocalFileManagerTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid
import Foundation
import UIKit

struct LocalFileManagerTests {
    
    let folderName = "TestImages"
    let imageName = "test_image"
    let fileManager = LocalFileManager.instance
    
    private func cleanUp() {
        guard let url = FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName) else { return }
        
        try? FileManager.default.removeItem(at: url)
    }

    @Test
    func test_saveImage_createsFile() async throws {
        cleanUp()
        
        let image = UIImage(systemName: "star")!
        fileManager.saveImage(image: image, imageName: imageName, folderName: folderName)
        
        let path = FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .appendingPathComponent(imageName + ".png")
            .path()
        
        #expect(FileManager.default.fileExists(atPath: path ?? "") == true)
    }

    @Test
    func test_getImage_returnsSavedImage() async throws {
        cleanUp()
        
        let image = UIImage(systemName: "star")!
        fileManager.saveImage(image: image, imageName: imageName, folderName: folderName)
        let loadedImage = fileManager.getImage(imageName: imageName, folderName: folderName)
        
        #expect(loadedImage != nil)
    }
    
    @Test
    func test_getImage_returnsNilIfImageNotExist() async throws {
        cleanUp()
        
        let loaded = fileManager.getImage(imageName: "nonexist", folderName: folderName)
        
        #expect(loaded == nil)
    }
}
