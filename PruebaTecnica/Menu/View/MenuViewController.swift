//
//  ViewController.swift
//  PruebaTecnica
//
//  Created by Miguel on 8/25/23.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    
    let presenter: MenuPresenterProtocol = MenuPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiConfiguration()
    }
    
    func uiConfiguration() {
        titleLabel.text = presenter.getTitleText()
        infoLabel.text = presenter.getInfoText()
        wordsLabel.text = presenter.getWordsText()
    }
}

