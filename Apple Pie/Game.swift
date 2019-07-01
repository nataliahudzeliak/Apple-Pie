//
//  Game.swift
//  Apple Pie
//
//  Created by MacOS on 2/9/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var additionalScore: Int
      
    
    
    
    
    var formattedWord: String {
   
        var guessedWord = ""
        for letter in word.characters{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
              
            }
            else {
                guessedWord += "_"
            }
            
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character){
    guessedLetters.append(letter)
        if !word.characters.contains(letter) {
            incorrectMovesRemaining -= 1
        } else {
            additionalScore += 1
            
        }
    }
    
    
}
