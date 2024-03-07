//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Kresimir Ivanjko on 07.03.2024..
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.SecondaryColor)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.stat1)
    }
}
