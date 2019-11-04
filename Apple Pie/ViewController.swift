//
//  ViewController.swift
//  Apple Pie
//
//  Created by Range, Noah H on 10/31/19.
//  Copyright © 2019 Range, Noah H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    var currentGame : Game!
    var listOfWords:[String] = ["pizza","green","soccer","basketball"]
    var totalWin = 0
    var totalLoss = 0
    var incorrectMoves = 7
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(newWord,incorrectMovesRemaining)
        print(newWord)
        currentGame.intialzeArray()
        
    }
    
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWin), Losses: \(totalLoss)"
        if (incorrectMoves == -1){
            treeImageView.image = UIImage(named: "Tree 0")
        }else{
            treeImageView.image = UIImage(named: "Tree \(incorrectMoves)")
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        if (!(currentGame.word.contains(letter)))&&incorrectMoves >= 0{
            incorrectMoves -= 1
        }
        if incorrectMoves == -1{
            print("You Lost!")
            for b in letterButtons{
                b.isEnabled = false
            }
        }
        updateUI()
    }
    
}

