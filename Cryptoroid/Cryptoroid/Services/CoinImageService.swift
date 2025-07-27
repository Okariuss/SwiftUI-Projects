//
//  CoinImageService.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 27.07.2025.
//

import SwiftUI
import Combine

final class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "Cryptoroid_Images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.dowmload(url: url)
            .tryMap({ data in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedImage in
                    guard let self, let returnedImage else { return }
                    self.image = returnedImage
                    self.imageSubscription?.cancel()
                    self.fileManager.saveImage(image: returnedImage, imageName: imageName, folderName: folderName)
                }
            )
    }
}
