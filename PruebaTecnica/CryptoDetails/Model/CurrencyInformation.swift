//
//  CurrencyInformation.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/25/23.
//

import Foundation

struct CurrencyInformation: Decodable {
    let ask_price: Float
    let ask_size: Float
    let bid_price: Float
    let bid_size: Float
    let last_trade: LastTrade
}

struct LastTrade: Decodable {
    let taker_side: String
}
