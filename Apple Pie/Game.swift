//
//  Game.swift
//  Apple Pie
//
//  Created by Range, Noah H on 11/4/19.
//  Copyright © 2019 Range, Noah H. All rights reserved.
//

import Foundation
struct Game{
    var word:String
    var guessedLetters:[Character]
    
    var formattedWord:String{
        var guessedWord = ""
        for letter in word{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter) "
            }else{
                guessedWord += "_ "
            }
        }
        return guessedWord
    }

    mutating func appendLetter(letter : Character){
        guessedLetters.append(letter)
    }
}
