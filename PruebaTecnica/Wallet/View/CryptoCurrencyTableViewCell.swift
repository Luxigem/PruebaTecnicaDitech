//
//  CryptoCurrencyTableViewCell.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/25/23.
//

import UIKit

class CryptoCurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        randomValues()
    }
    
    func randomValues() {
        let presenter: WalletPresenterProtocol = WalletPresenter()
        
        valueLabel.text = presenter.getRandomValue()
        let changeValues: (change: String, color: UIColor) = presenter.getRandomChange()
        changeLabel.text = changeValues.change
        changeLabel.textColor = changeValues.color
    }
}
