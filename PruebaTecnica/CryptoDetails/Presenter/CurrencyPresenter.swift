//
//  CurrencyPresenter.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/25/23.
//

import Foundation

protocol CurrencyPresenterDelegate {
    func didObtainInformation(info: CurrencyModel)
    func didFailWithError(error: Error)
}

protocol CurrencyPresenterProtocol {
    var delegate: CurrencyPresenterDelegate? { get set }
    func performRequest(id: String, urlSession: URLSession)
}

extension CurrencyPresenterProtocol {
    func performRequest(id: String, urlSession: URLSession = URLSession(configuration: .default)) {
        return performRequest(id: id, urlSession: urlSession)
    }
}

struct CurrencyPresenter: CurrencyPresenterProtocol {
    var delegate: CurrencyPresenterDelegate?
    
    func performRequest(id: String, urlSession: URLSession = URLSession(configuration: .default)) {
        let urlString: String = "https://rest.coinapi.io/v1/quotes/BITSTAMP_SPOT_\(id)_USD/current?apikey=85DA0131-A9BB-4E35-AABA-A0DF64603FE3"
        if let url: URL = URL(string: urlString) {
            let session: URLSession = urlSession
            let task: URLSessionDataTask = session.dataTask(with: url) { data, response, error in
                if let safeError: Error = error {
                    self.delegate?.didFailWithError(error: safeError)
                    return
                }
                if let safeData: Data = data,
                   let info: CurrencyModel = self.parseJSON(safeData) {
                    self.delegate?.didObtainInformation(info: info)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ infoData: Data) -> CurrencyModel? {
        var informationModel: CurrencyModel = CurrencyModel()
        let decoder: JSONDecoder = JSONDecoder()
        do {
            let decodedData: CurrencyInformation = try decoder.decode(CurrencyInformation.self, from: infoData)
            
            informationModel.currencyAskPrice = decodedData.ask_price
            informationModel.currencyAskSize = decodedData.ask_size
            informationModel.currencyBidPrice = decodedData.bid_price
            informationModel.currencyBidSize = decodedData.bid_size
            informationModel.currencyTakerSide = decodedData.last_trade.taker_side
            
            return informationModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

