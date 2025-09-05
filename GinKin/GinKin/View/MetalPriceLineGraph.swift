//
//  MetalPriceLineGraph.swift
//  GinKin
//
//  Created by Gregg Abe on 9/1/25.
//

import SwiftUI

struct MetalPriceLineGraph: View {
    let prices: [Double]
    let netWorth: Double
    
    var body: some View {
        HStack(spacing: 8) {
            LineGraphView(prices: prices)
            
            YAxisView(prices: prices, netWorth: netWorth)
                .offset(x: 35)
        }
        .frame(height: UIScreen.main.bounds.height * 0.25)
        .padding(.horizontal)
        .background(Color("AppBackgroundColor"))
    }
}

struct MetalPriceLineGraph_Previews: PreviewProvider {
    static var previews: some View {
        MetalPriceLineGraph(prices: [
            1_200_000, 1_230_000, 1_210_000, 1_250_000, 1_210_000, 1_270_000, 1_310_000,
            1_340_000, 1_320_000, 1_360_000, 1_380_000, 1_370_000, 1_410_000, 1_450_000,
            1_430_000, 1_480_000, 1_500_000, 1_490_000, 1_530_000, 1_570_000.69
        ], netWorth: 1804047.69)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
