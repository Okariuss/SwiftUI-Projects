//
//  MarketDataService.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 28.07.2025.
//

import Foundation
import Combine

final class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.dowmload(url: url)
            .decode(type: GlobalDataModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedGlobalData in
                    guard let self else { return }
                    self.marketData = returnedGlobalData.data
                    self.marketDataSubscription?.cancel()
                }
            )
    }
}

