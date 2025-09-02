//
//  MetalsPriceBannerView.swift
//  GinKin
//
//  Created by Gregg Abe on 9/1/25.
//

import SwiftUI

struct MetalsPriceBannerView: View {
    let metalPriceArray: [TempMetalPrice]
    let spacing: CGFloat = 40
    let speed: CGFloat = 40 // points per second

    @State private var offsetX: CGFloat = 0
    @State private var rowWidth: CGFloat? = nil

    var body: some View {
        GeometryReader { geo in
            if let rowWidth = rowWidth {
                HStack(spacing: 0) {
                    // Duplicate the row twice for seamless looping
                    HStack(spacing: spacing) {
                        ForEach(metalPriceArray) { metal in
                            MetalPriceBanner(metal: metal)
                                .fixedSize()
                        }
                        
                        Spacer()
                    }

                    HStack(spacing: spacing) {
                        ForEach(metalPriceArray) { metal in
                            MetalPriceBanner(metal: metal)
                                .fixedSize()
                        }
                        
                        Spacer()
                    }
                }
                .offset(x: offsetX)
                .onAppear {
                    let duration = Double(rowWidth / speed)
                    withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                        offsetX = -rowWidth
                    }
                }
            } else {
                // Measure the row width dynamically
                HStack(spacing: spacing) {
                    ForEach(metalPriceArray) { metal in
                        MetalPriceBanner(metal: metal)
                            .fixedSize()
                    }
                    
                    Spacer()
                }
                .background(
                    GeometryReader { rowGeo in
                        Color.clear
                            .onAppear {
                                rowWidth = rowGeo.size.width
                                offsetX = 0
                            }
                    }
                )
            }
        }
        .frame(height: 50)
        .clipped()
    }
}

#Preview {
    MetalsPriceBannerView(metalPriceArray: [
        TempMetalPrice(symbol: "GOLD", price: 3509.60, change: 0.46),
        TempMetalPrice(symbol: "SILVER", price: 40.95, change: -0.53),
        TempMetalPrice(symbol: "PLATINUM", price: 1429.50, change: 0.48),
        TempMetalPrice(symbol: "PALLADIUM", price: 1163.00, change: -0.74),
        TempMetalPrice(symbol: "RHODIUM", price: 7050.00, change: 2.17)
    ])
    .preferredColorScheme(.dark)
}
