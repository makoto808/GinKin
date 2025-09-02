//
//  MetalPriceLineGraph.swift
//  GinKin
//
//  Created by Gregg Abe on 9/1/25.
//

import SwiftUI

struct MetalPriceLineGraph: View {
    let prices: [Double]

    var body: some View {
        GeometryReader { geometry in
            let maxPrice = prices.max() ?? 1
            let minPrice = prices.min() ?? 0
            let height = geometry.size.height
            let width = geometry.size.width
            let stepX = width / CGFloat(prices.count - 1)

            Path { path in
                for index in prices.indices {
                    let x = CGFloat(index) * stepX
                    let y = height - ((CGFloat(prices[index] - minPrice) / CGFloat(maxPrice - minPrice)) * height)

                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(
                Color.yellow,
                style: StrokeStyle(lineWidth: 2, lineJoin: .round)
            )
        }
        .frame(height: UIScreen.main.bounds.height * 0.25) // dynamic 1/4 screen height
        .padding(.horizontal) // optional padding from edges
        .background(Color("AppBackgroundColor"))
    }
}

struct MetalPriceLineGraph_Previews: PreviewProvider {
    static var previews: some View {
        MetalPriceLineGraph(prices: [
            120, 123, 121, 125, 121, 127, 131, 134, 132, 136,
            138, 137, 141, 145, 143, 148, 150, 149, 153, 157
        ])
        .previewLayout(.sizeThatFits)
    }
}
