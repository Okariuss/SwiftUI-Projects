//
//  CoinImageViewModel.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 27.07.2025.
//

import SwiftUI
import Combine

final class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.isLoading = true
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink(receiveValue: { [weak self] returnedImage in
                guard let self else { return }
                self.image = returnedImage
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
}
