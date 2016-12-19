//
//  ViewController.swift
//  FindTheMatch
//
//  Created by Mohsin Mahmood on 12/19/16.
//  Copyright © 2016 assesment. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var turnNumber: UILabel!
    
    @IBOutlet var correctWordInARow: UILabel!
    var correctWordInARowInt: Int = 0
    var turnNo:Int = 1
    var correctWord:WordEqualModel?
    var randomSelectedWords:[WordEqualModel] = [WordEqualModel]()
    @IBOutlet var englishWord: UILabel!
    
    @IBOutlet var spanishMeaningLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonArray = HelperClass.parselocalJson()
        HelperClass.wordsArray = jsonArray
        chooseNewWord()
        populateLabels()
        startAnimationOfWords()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func populateLabels()
    {
        self.englishWord.text = correctWord?.englishWord
        turnNumber.text = "\(turnNo)"
        correctWordInARow.text = "\(correctWordInARowInt)"
        
        //blink animation
        self.englishWord.alpha = 0.1
        self.englishWord.textColor = UIColor.green
        UIView.animate(withDuration: 01) {
            self.englishWord.alpha = 1
            self.englishWord.textColor = UIColor.black
        }
    }
    
    private func chooseNewWord()
    {
        let jsonArray = HelperClass.wordsArray
        randomSelectedWords = HelperClass.getRandomNumbers(from: jsonArray, count: 4)
        correctWord = randomSelectedWords[0]
        self.englishWord.text = correctWord?.englishWord
    }
    func startAnimationOfWords()
    {
        let nowShowing = HelperClass.getRandomNumber(between: randomSelectedWords.count)
        self.spanishMeaningLb.text = randomSelectedWords[nowShowing].spanishWord
        self.spanishMeaningLb.center = CGPoint(x: self.spanishMeaningLb.center.x, y: -80)
        scored = false
        UIView.animate(withDuration: 4, animations: {
            self.spanishMeaningLb.center = CGPoint(x: self.spanishMeaningLb.center.x, y: UIScreen.main.bounds.height)
        }) { (comp) in
            if self.scored == false
            {
                self.perform(Selector("startAnimationOfWords"), with: nil, afterDelay: 0.1)
            }
        }
    }
    
    var scored = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self.view)
        if ((self.spanishMeaningLb.layer.presentation()!.hitTest(point!)) != nil)
        {
            scored = true
            calculateScore()
        }
    }
    
    
    private func calculateScore()
    {
        if correctWord?.spanishWord == self.spanishMeaningLb.text
        {
            correctWordInARowInt += 1
            if(correctWordInARowInt >= 4)
            {
                //You Win
                self.performSegue(withIdentifier: "gameOver", sender: "Hurray! You Won!")
                return
            }
        }
        else
        {
            turnNo += 1
            correctWordInARowInt = 0
            if(turnNo > 3)
            {
                self.performSegue(withIdentifier: "gameOver", sender: "You Lost")
                return
            }

        }
        chooseNewWord()
        populateLabels()
        startAnimationOfWords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ctrl:GameOverController = segue.destination as! GameOverController
        ctrl.playerWon = sender as! String
    }
    
  }

