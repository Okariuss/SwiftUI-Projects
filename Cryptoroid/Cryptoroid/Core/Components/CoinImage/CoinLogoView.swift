//
//  CoinLogoView.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 28.07.2025.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinLogoView(coin: DeveloperPreview.instance.coin)
}
