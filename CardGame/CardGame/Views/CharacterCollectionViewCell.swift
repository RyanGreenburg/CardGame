//
//  CharacterCollectionViewCell.swift
//  CardGame
//
//  Created by RYAN GREENBURG on 12/14/20.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    func displayImage(for character: Character) {
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.image = character.photo
    }
}
