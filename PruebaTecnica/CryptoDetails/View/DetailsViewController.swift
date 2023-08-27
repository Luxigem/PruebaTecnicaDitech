//
//  DetailsViewController.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/25/23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var askPriceLabel: UILabel!
    @IBOutlet weak var askSizeLabel: UILabel!
    @IBOutlet weak var bidPriceLabel: UILabel!
    @IBOutlet weak var bidSizeLabel: UILabel!
    @IBOutlet weak var decisionLabel: UILabel!
    var currencyPresenter: CurrencyPresenterProtocol = CurrencyPresenter()
    var currencyName: String?
    var currencyId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCurrencyInfo()
    }

    func updateCurrencyInfo() {
        currencyPresenter.delegate = self
        nameLabel.text = currencyName
        idLabel.text = currencyId
        if let currencyId: String = currencyId {
            logoImageView.image = UIImage(named: currencyId)
            currencyPresenter.performRequest(id: currencyId)
        }
    }
}

extension DetailsViewController: CurrencyPresenterDelegate {
    func didObtainInformation(info: CurrencyModel) {
        DispatchQueue.main.async {
            self.askPriceLabel.text = "\(String(describing: info.currencyAskPrice ?? .zero) + KCryptoDetails.DetailsViewController.usd)"
            self.askSizeLabel.text = "\(String(describing: info.currencyAskSize ?? .zero) + KCryptoDetails.DetailsViewController.usd)"
            self.bidPriceLabel.text = "\(String(describing: info.currencyBidPrice ?? .zero) + KCryptoDetails.DetailsViewController.usd)"
            self.bidSizeLabel.text = "\(String(describing: info.currencyBidSize ?? .zero) + KCryptoDetails.DetailsViewController.usd)"
            self.decisionLabel.text = info.currencyTakerSide
        }
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            let errorAlert: UIAlertController = UIAlertController(title: KCryptoDetails.DetailsViewController.errorTitle, message: "\(KCryptoDetails.DetailsViewController.errorMessage) \(error)", preferredStyle: UIAlertController.Style.alert)
            let action: UIAlertAction = UIAlertAction(title: KCryptoDetails.DetailsViewController.alertTitle, style: .cancel)
            errorAlert.addAction(action)
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
}
