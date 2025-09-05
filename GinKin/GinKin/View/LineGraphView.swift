//
//  LineGraphView.swift
//  GinKin
//
//  Created by Gregg Abe on 9/2/25.
//

import SwiftUI

struct LineGraphView: View {
    let prices: [Double]
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            let maxPrice = prices.max() ?? 1
            let minPrice = prices.min() ?? 0
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
            .stroke(Color.yellow, style: StrokeStyle(lineWidth: 2, lineJoin: .round))
        }
    }
}
