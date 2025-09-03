//
//  YAxisView.swift
//  GinKin
//
//  Created by Gregg Abe on 9/2/25.
//

import SwiftUI

struct YAxisView: View {
    let prices: [Double]    // raw values for the line (e.g., daily net worth)
    let netWorth: Double    // current total net worth
    
    var body: some View {
        GeometryReader { geometry in
            let maxPrice = prices.max() ?? netWorth
            let minPrice = prices.min() ?? netWorth * 0.9  // optional buffer below current net worth
            
            VStack {
                ForEach(0..<5) { i in
                    // Fraction goes from top to bottom (1 → 0)
                    let fraction = 1.0 - (Double(i) / 4.0)
                    
                    // Scale fraction to min/max relative to netWorth
                    let value = minPrice + fraction * (maxPrice - minPrice)
                    
                    Text(format(value))
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .frame(maxHeight: .infinity, alignment: .top)
                }
            }
        }
        .frame(width: 70)
    }
    
    private func format(_ value: Double) -> String {
        if value >= 1_000_000 {
            return String(format: "$%.2fM", value / 1_000_000)
        } else if value >= 1_000 {
            return String(format: "$%.0fK", value / 1_000)
        } else {
            return String(format: "$%.0f", value)
        }
    }
}

struct YAxisView_Previews: PreviewProvider {
    static var previews: some View {
        YAxisView(
            prices: [
                1_200_000, 1_230_000, 1_210_000, 1_250_000, 1_210_000,
                1_270_000, 1_310_000, 1_340_000, 1_320_000, 1_360_000,
                1_380_000, 1_370_000, 1_410_000, 1_450_000, 1_430_000,
                1_480_000, 1_500_000, 1_490_000, 1_530_000, 1_570_000
            ],
            netWorth: 1_832_187
        )
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
