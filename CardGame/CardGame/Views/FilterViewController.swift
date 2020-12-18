//
//  ViewController.swift
//  CardGame
//
//  Created by RYAN GREENBURG on 12/17/20.
//

import UIKit

protocol FilterSelectionDelegate: class {
    func selected(faction: String)
}

class FilterViewController: UIViewController {

    weak var delegate: FilterSelectionDelegate?
    
    @IBAction func sithButtonTapped(_ sender: Any) {
        delegate?.selected(faction: "sith")
        self.dismiss(animated: true)
    }
    
    @IBAction func jediButtonTapped(_ sender: Any) {
        delegate?.selected(faction: "jedi")
        self.dismiss(animated: true)
    }
}
