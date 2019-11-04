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
    let listOfWords:[String] = ["pizza","green","soccer","basketball"]
    var totalWin = 0
    var totalLoss = 0
    let incorrectMoves = 7
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func newRound(){
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

