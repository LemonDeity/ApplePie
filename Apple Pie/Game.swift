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
    var incorrectMovesRemaining : Int
    var correctLettersGuessed:[Character]
    var piece:String
    init(_ word:String, _ moves:Int){
        self.word = word
        incorrectMovesRemaining = moves
        correctLettersGuessed = Array(repeating: "_", count: moves)
        piece = ""
        updatePiece()
    }
    mutating func updatePiece(){
        piece = ""
        for i in correctLettersGuessed{
            piece += String(i)
        }
    }
}
