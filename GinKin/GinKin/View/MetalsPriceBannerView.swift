//
//  MetalsPriceBannerView.swift
//  GinKin
//
//  Created by Gregg Abe on 9/1/25.
//

import SwiftUI

struct MetalsPriceBannerView: View {
    let metalPriceArray: [TempMetalPrice]
    let speed: Double = 20
    
    @State private var animate = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 40) {
                ForEach(metalPriceArray) { metal in
                    MetalPriceBanner(metal: metal)
                }
                ForEach(metalPriceArray) { metal in
                    MetalPriceBanner(metal: metal) // duplicate for smooth loop later
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 50)
        .background(Color.black)
        .border(Color.red, width: 2) 
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
        .background(Color.black)
    }
    .preferredColorScheme(.dark)
}
