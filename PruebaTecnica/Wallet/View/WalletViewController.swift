//
//  WalletViewController.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/25/23.
//

import UIKit

class WalletViewController: UIViewController {
    
    @IBOutlet weak var currencyTableView: UITableView!
    
    let presenter: WalletPresenterProtocol = WalletPresenter()
    var currencies: [(currencyName: String, currencyId: String)] = []
    var selectedCurrency: (currencyName: String, currencyId: String)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencies = presenter.getCurrenciesList()
        tableViewConfiguration()
    }
    
    func tableViewConfiguration() {
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        currencyTableView.register(UINib(nibName: KWallet.WalletViewController.cellName, bundle: nil), forCellReuseIdentifier: KWallet.WalletViewController.cellName)
        currencyTableView.rowHeight = KWallet.WalletViewController.rowHeight
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: DetailsViewController = segue.destination as! DetailsViewController
        if let selectedCurrency: (currencyName: String, currencyId: String) = selectedCurrency {
            destinationVC.currencyName = selectedCurrency.currencyName
            destinationVC.currencyId = selectedCurrency.currencyId
        }
    }
}

extension WalletViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCurrency = currencies[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: KWallet.WalletViewController.segueName, sender: self)
    }
}

extension WalletViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currency: (currencyName: String, currencyId: String) = currencies[indexPath.row]
        let cell: CryptoCurrencyTableViewCell = self.currencyTableView.dequeueReusableCell(withIdentifier: KWallet.WalletViewController.cellName, for: indexPath) as! CryptoCurrencyTableViewCell
        cell.nameLabel.text = currency.currencyName
        cell.idLabel.text = currency.currencyId
        cell.logoImageView.image = UIImage(named: currency.currencyId)
        return cell
    }
}
