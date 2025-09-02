//
//  TempMetalPrice.swift
//  GinKin
//
//  Created by Gregg Abe on 9/1/25.
//

import Foundation

struct TempMetalPrice: Identifiable {
    let id = UUID()
    let symbol: String
    let price: Double
    let change: Double
}

