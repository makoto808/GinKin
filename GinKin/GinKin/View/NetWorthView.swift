//
//  NetWorthView.swift
//  GinKin
//
//  Created by Gregg Abe on 9/2/25.
//

import SwiftUI

struct NetWorthView: View {
    let priceChange: Double = 0.0
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Net Worth")
                    .font(.headline)
                
                (
                    Text("$1,832,187")
                        .font(.title) +
                    Text(".69")
                        .font(.title2)
                )
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            }
            .layoutPriority(1)
            .padding(.horizontal)
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(priceChange >= 0 ? "+" : "")$\(String(format: "%.2f", priceChange)) (1.95%) today")
                    .font(.headline)
                    .foregroundColor(priceChange >= 0 ? .green : .red)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
        }
//        .border(Color.red) //debugging frame
    }
}


#Preview {
    NetWorthView()
        .preferredColorScheme(.dark)
}
