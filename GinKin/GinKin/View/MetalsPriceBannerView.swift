//
//  MetalsPriceBannerView.swift
//  GinKin
//
//  Created by Gregg Abe on 9/1/25.
//

import SwiftUI

struct MetalsPriceBannerView: View {
    let metalPriceArray: [TempMetalPrice]
    let speed: CGFloat = 40 // points per second
    
    @State private var rowWidth: CGFloat? = nil
    
    var body: some View {
        GeometryReader { geo in
            TimelineView(.animation) { timeline in
                let time = CGFloat(timeline.date.timeIntervalSinceReferenceDate)
                
                if let rowWidth = rowWidth {
                    let repeatCount = Int(ceil(geo.size.width / rowWidth)) + 2
                    
                    HStack(spacing: 0) {
                        ForEach(0..<repeatCount, id: \.self) { _ in
                            HStack(spacing: 40) {
                                ForEach(metalPriceArray) { metal in
                                    MetalPriceBanner(metal: metal)
                                        .fixedSize()
                                }
                                Spacer() // <- adds extra space at the end of the row
                                    .frame(width: 100) // adjust width as desired
                            
                        }
                    }
                }
                    .offset(x: -(time * speed).truncatingRemainder(dividingBy: rowWidth))
                    .frame(height: 50)
                    .border(Color.red, width: 2)
                    .background(Color.black)
            } else {
                // temporary single row to measure width
                HStack(spacing: 40) {
                    ForEach(metalPriceArray) { metal in
                        MetalPriceBanner(metal: metal)
                            .fixedSize()
                    }
                }
                .background(
                    GeometryReader { geoRow in
                        Color.clear
                            .onAppear {
                                rowWidth = geoRow.size.width
                            }
                    }
                )
            }
        }
    }
        .frame(height: 50)
}
}

#Preview {
    ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 40) {
            MetalPriceBanner(metal: TempMetalPrice(symbol: "GOLD", price: 3509.60, change: 0.46))
            MetalPriceBanner(metal: TempMetalPrice(symbol: "SILVER", price: 40.95, change: -0.53))
            MetalPriceBanner(metal: TempMetalPrice(symbol: "PLATINUM", price: 1429.50, change: 0.48))
            MetalPriceBanner(metal: TempMetalPrice(symbol: "PALLADIUM", price: 1163.00, change: -0.74))
            MetalPriceBanner(metal: TempMetalPrice(symbol: "RHODIUM", price: 7050.00, change: 2.17))
        }
        .padding()
        .frame(height: 50)
        .background(Color("AppBackgroundColor"))
        .border(Color.red, width: 2)
    }
    .preferredColorScheme(.dark)
}
