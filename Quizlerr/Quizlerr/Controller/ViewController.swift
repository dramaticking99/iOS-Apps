//
//  ViewController.swift
//  Quizlerr
//
//  Created by Chetan Sanwariya on 25/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var QuestionLable: UITextView!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var ProgressView: UIProgressView!
    
    var Quiz = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressView.progress = 0.0
        UpdateUI()
        
    }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        var userGotItRight = Quiz.checkAnswer(userAnswer: (sender.titleLabel?.text)! )
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        Quiz.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(UpdateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func UpdateUI(){
        var score = Quiz.score
        scoreLable.text = "Score:\(score)"
        
        QuestionLable.text = Quiz.getQuestionText()
        
        ProgressView.progress = Quiz.getProgress()
        
        TrueButton.backgroundColor = UIColor.clear
        FalseButton.backgroundColor = UIColor.clear
        
        
    }
    
    
}

