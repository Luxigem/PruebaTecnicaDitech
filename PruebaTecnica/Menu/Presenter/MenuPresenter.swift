//
//  MenuPresenter.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/26/23.
//

import Foundation

protocol MenuPresenterProtocol {
    func getTitleText() -> String
    func getInfoText() -> String
    func getWordsText() -> String
}

struct MenuPresenter: MenuPresenterProtocol {
    
    let model: MenuModel = MenuModel()
    
    func getTitleText() -> String {
        return model.titleText
    }
    
    func getInfoText() -> String {
        return model.infoText
    }
    
    func getWordsText() -> String {
        return model.wordsText
    }
}
