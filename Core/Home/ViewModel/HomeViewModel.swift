//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Kresimir Ivanjko on 05.02.2024..
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistic: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentChange: -1)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
        }

    func addSubscriber() {

        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .map { (marketDataModel) -> [StatisticModel] in
                
                var stats: [StatisticModel] = []
                
                guard let data = marketDataModel else {
                    return stats
                }
                
                let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentChange: data.pr
    )
            }
        
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
                coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
        
    }
}
