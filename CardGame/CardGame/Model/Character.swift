//
//  Character.swift
//  CardGame
//
//  Created by RYAN GREENBURG on 12/14/20.
//

import UIKit

class Character {
    let name: String
    let photo: UIImage?
    
    init(name: String, photo: UIImage?) {
        self.name = name
        self.photo = photo
    }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name && lhs.photo == rhs.photo
    }
}
