//
//  StatisticModel.swift
//  CryptoApp
//
//  Created by Kresimir Ivanjko on 07.03.2024..
//

import Foundation

struct StatisticModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentChange: Double?
    
    init(title: String, value: String, percentChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentChange = percentChange
    }
    
}

