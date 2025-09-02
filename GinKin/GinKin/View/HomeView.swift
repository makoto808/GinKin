//
//  HomeView.swift
//  GinKin
//
//  Created by Gregg Abe on 8/31/25.
//

import SwiftUI

struct HomeView: View {
    @State private var metals: [TempMetalPrice] = [
        TempMetalPrice(symbol: "GOLD", price: 3509.60, change: 0.46),
        TempMetalPrice(symbol: "SILVER", price: 40.95, change: -0.53),
        TempMetalPrice(symbol: "PLATINUM", price: 1429.50, change: 0.48),
        TempMetalPrice(symbol: "PALLADIUM", price: 1163.00, change: -0.74),
        TempMetalPrice(symbol: "RHODIUM", price: 7050.00, change: 2.17)
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            MetalsPriceBannerView(metalPriceArray: metals)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
//                .border(Color.red, width: 2) // debug border
            
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Net Worth")
                        .font(.headline)
                    
                    Text("$1,832,187") // dollars
                        .font(.title) +
                    Text(".69") // cents
                        .font(.title2) // smaller font
                }
                .frame(maxWidth: .infinity, alignment: .leading) // forces leading alignment
                .padding(.horizontal) // optional padding from edges
                
                MetalPriceLineGraph(prices: [
                    120, 123, 121, 125, 121, 127, 131, 134, 132, 136,
                    138, 137, 141, 145, 143, 148, 150, 149, 153, 157
                ])
            }

        }
        .background(Color("AppBackgroundColor"))
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
// tab bar L to R (Home, Stack, Settings

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//            .preferredColorScheme(.dark)
//    }
//}
