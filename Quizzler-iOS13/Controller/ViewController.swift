//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
        
        //checking the user answer against the real answer
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if quizBrain.nextQuestion() {
            restartQuiz()
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText() //quiz[questionNumber].text
        progressBar.progress = quizBrain.getProgress() //Float(questionNumber + 1) / Float(quiz.count)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
    func restartQuiz() {
        quizBrain.updateQuestion(0)
        progressBar.progress = 0.0
    }
}

