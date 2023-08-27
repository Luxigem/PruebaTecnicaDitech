//
//  WalletPresenter.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/26/23.
//

import UIKit

protocol WalletPresenterProtocol {
    func getCurrenciesList() -> [(currencyName: String, currencyId: String)]
    func getRandomValue() -> String
    func getRandomChange() -> (change: String, color: UIColor)
}

struct WalletPresenter: WalletPresenterProtocol {
    
    let model: WalletModel = WalletModel()
    
    func getCurrenciesList() -> [(currencyName: String, currencyId: String)] {
        return model.currencies
    }
    
    func getRandomValue() -> String {
        let value: Float = Float.random(in: 0.00 ... 1000.00)
        let roundedValue: String = String(format: "%.2f", value)
        return roundedValue
    }
    
    func getRandomChange() -> (change: String, color: UIColor) {
        
        var changeText: String = ""
        var changeColor: UIColor = UIColor.clear
        
        let change: Float = Float.random(in: -5.00 ... 5.00)
        let roundedChange: String = String(format: "%.2f", change)

        if change > 0 {
            changeText = "+\(roundedChange)%"
            changeColor = UIColor.green
        } else if change < 0 {
            changeText = "\(roundedChange)%"
            changeColor = UIColor.red
        } else {
            changeText = "\(change)%"
            changeColor = UIColor.yellow
        }
        
        return (change: changeText, color: changeColor)
    }
}
