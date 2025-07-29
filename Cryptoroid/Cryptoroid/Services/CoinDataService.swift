//
//  CoinDataService.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 27.07.2025.
//

import Foundation
import Combine

final class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else { return }
        
        coinSubscription = NetworkingManager.dowmload(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedCoins in
                    guard let self else { return }
                    self.allCoins = returnedCoins
                    self.coinSubscription?.cancel()
                }
            )
    }
}
