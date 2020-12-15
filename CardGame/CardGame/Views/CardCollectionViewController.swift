//
//  CardCollectionViewController.swift
//  CardGame
//
//  Created by RYAN GREENBURG on 12/14/20.
//

import UIKit

class CardCollectionViewController: UICollectionViewController {
    
    private var displayedCharacters: [Character] = []
    private var targetCharacter: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCharacters()
        
    }
    
    func shuffleCharacters() {
        CharacterController.characters.shuffle()
        let charactersToShow = CharacterController.characters.prefix(4)
        displayedCharacters = Array(charactersToShow)
        targetCharacter = displayedCharacters.randomElement()
        updateViews()
    }
    
    private func updateViews() {
        guard let target = targetCharacter else { return }
        title = "Find \(target.name)"
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return displayedCharacters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell() }
        let character = displayedCharacters[indexPath.row]
        
        cell.displayImage(for: character)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = displayedCharacters[indexPath.row]
        presentAlert(for: selectedCharacter)
    }
    
    func presentAlert(for character: Character) {
        let success = character == targetCharacter
        let alertController = UIAlertController(title: success ? "Good Job!" : "Better luck next time", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Suffle!", style: .default) { _ in
            self.shuffleCharacters()
        }
        
        alertController.addAction(doneAction)
        
        if success {
            alertController.addAction(shuffleAction)
        }
        
        present(alertController, animated: true)
    }
}

extension CardCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 15, height: width + 30)
    }
}
