//
//  DetailView.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 29.07.2025.
//

import SwiftUI

struct DetailLoadingView : View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        self._vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                
                VStack(spacing: 20) {
                    setTitle(title: "Overview")
                    Divider()
                    setStatsGrid(stats: vm.additionalStatistics)
                    setTitle(title: "Additional Details")
                    Divider()
                    setStatsGrid(stats: vm.additionalStatistics)
                }
                .padding()
            }
        }
        .navigationTitle(vm.coin.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                navigationBarTrailingItems
            }
        }
    }
}

extension DetailView {
    
    private var navigationBarTrailingItems: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .foregroundStyle(.secondaryText)
            
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private func setTitle(title: String) -> some View {
        Text(title)
            .font(.title)
            .bold()
            .foregroundStyle(.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func setStatsGrid(stats: [StatisticModel]) -> some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: []) {
                ForEach(stats) { stat in
                    StatisticView(stat: stat)
                }
            }
    }
}

#Preview {
    NavigationStack {
        DetailView(coin: DeveloperPreview.instance.coin)
    }
}
