//
//  CurrencyPresenterDelegateMock.swift
//  PruebaTecnicaTests
//
//  Created by Miguel on 8/27/23.
//

@testable import PruebaTecnica

class CurrencyPresenterDelegateMock: CurrencyPresenterDelegate {

    var currencyModel: CurrencyModel?
    var error: Error?
    
    func didObtainInformation(info: PruebaTecnica.CurrencyModel) {
        self.currencyModel = info
    }
    
    func didFailWithError(error: Error) {
        self.error = error
    }
}
