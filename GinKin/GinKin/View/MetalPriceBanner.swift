//
//  MetalPriceBanner.swift
//  GinKin
//
//  Created by Gregg Abe on 9/1/25.
//

import SwiftUI

struct MetalPriceBanner: View {
    let metal: TempMetalPrice
    
    var body: some View {
        HStack(spacing: 8) {
            Text(metal.symbol)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
            Text(String(format: "$ %.2f", metal.price))
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
            Text(String(format: "%.2f %%", metal.change))
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(metal.change >= 0 ? .green : .red)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
        }
    }
}

#Preview("MetalPriceBanner Variants") {
    ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 40) {
            MetalPriceBanner(
                metal: TempMetalPrice(symbol: "GOLD", price: 1925.42, change: 5.34)
            )
            MetalPriceBanner(
                metal: TempMetalPrice(symbol: "SILVER", price: 24.18, change: -0.12)
            )
            MetalPriceBanner(
                metal: TempMetalPrice(symbol: "PLATINUM", price: 891.77, change: 2.21)
            )
        }
        .padding()
        .frame(height: 50)
        .background(Color.black)
    }
    .preferredColorScheme(.dark)
}

