//
//  HomeViewModel.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 27.07.2025.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                guard let self else { return }
                self.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
