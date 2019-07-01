//
//  ViewController.swift
//  Apple Pie
//
//  Created by MacOS on 2/9/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["cat", "swift", "town", "equipment", "forecast", "university"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            
            additionalScoreLabel.text = String(currentGame.additionalScore)
            newRound()
        }
    }
   
    var totalLosses = 0 {
    didSet{
       newRound()
          }
    }
    var currentGame: Game!
    
   
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var additionalScoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    override func viewDidLoad() {
       newRound()
    }


    func newRound(){
        if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [], additionalScore: Int(additionalScoreLabel.text!) ?? 0
                )
            enableLettersButtons(true)
            updateUI()
            
        } else {
            enableLettersButtons(false)
        }
    }
    func enableLettersButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
        
    }
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord.map({String($0)} ){
            letters.append(letter)
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        
        
        additionalScoreLabel.text =  String(currentGame.additionalScore)
        scoreLabel.text = "Wins: \(totalWins), Loses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
        
    }
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
            
        }
        else if currentGame.formattedWord == currentGame.word {
            currentGame.additionalScore += 10
            totalWins += 1
        } else {
            updateUI()
            
        }
    }
}

