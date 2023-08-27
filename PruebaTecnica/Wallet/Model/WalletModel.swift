//
//  WalletModel.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/26/23.
//

import Foundation

struct WalletModel {
    let currencies: [(currencyName: String, currencyId: String)] = [
        (currencyName: "Bitcoin", currencyId: "BTC"),
        (currencyName: "Ethereum", currencyId: "ETH"),
        (currencyName: "Litecoin", currencyId: "LTC"),
        (currencyName: "XRP", currencyId: "XRP"),
        (currencyName: "Cardano", currencyId: "ADA"),
        (currencyName: "Solana", currencyId: "SOL"),
        (currencyName: "Polkadot", currencyId: "DOT"),
        (currencyName: "Stellar", currencyId: "XLM"),
        (currencyName: "Lido DAO", currencyId: "LDO"),
        (currencyName: "Maker", currencyId: "MKR"),
    ]
}
