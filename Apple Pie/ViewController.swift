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
    var totalWin : Int = 0{
        willSet(newWin){
            scoreLabel.text = "Wins: \(totalWin), Losses: \(totalLoss)"
        }
        didSet{
            scoreLabel.text = "Wins: \(totalWin), Losses: \(totalLoss)"
        }
    }
    var totalLoss : Int = 0{
        willSet(newLoss){
            scoreLabel.text = "Wins: \(totalWin), Losses: \(totalLoss)"
        }
        didSet{
            scoreLabel.text = "Wins: \(totalWin), Losses: \(totalLoss)"
        }
    }
    var incorrectMoves = 7
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, guessedLetters: [])
            print(newWord)
            incorrectMoves = 7
            updateUI()
            enableButtons(true)
        }else{
            enableButtons(false)
        }
        
    }
    
    @IBAction func restart(_ sender: UITapGestureRecognizer) {
        newRound()
    }
    
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWin), Losses: \(totalLoss)"
        correctWordLabel.text = currentGame.formattedWord
        
        if (incorrectMoves == -1){
            treeImageView.image = UIImage(named: "Tree 0")
            correctWordLabel.text = "YOU LOST !!! The right answer was \(currentGame.word)"
            totalLoss += 1
        }else{
            treeImageView.image = UIImage(named: "Tree \(incorrectMoves)")
            if !currentGame.formattedWord.contains("_"){
                correctWordLabel.text = "YOU WON !!! The Answer is \(currentGame.word). Click on the Tree to start a new Round"
                enableButtons(false)
                totalWin += 1
            }
        }
    }
    
    func enableButtons(_ bool:Bool){
        for b in letterButtons{
            b.isEnabled = bool
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        
        if (!(currentGame.word.contains(letter)))&&incorrectMoves >= 0{
            incorrectMoves -= 1
        }else{
            currentGame.appendLetter(letter : letter)
            for i in currentGame.guessedLetters{
                print(i)
            }
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

