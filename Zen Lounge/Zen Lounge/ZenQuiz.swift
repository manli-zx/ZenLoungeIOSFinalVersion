//
//  ZenQuiz.swift
//  Zen Lounge
//
//  Created by admin on 2019-04-14.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ZenQuiz: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        nextQuestion()
    }
    //Funtion pressed answer
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        nextQuestion()
    }
    //Funtion that updates:Score andQuestion number
    func updateUI(){
        
        scoreLabel.text = "Score: \(score * 2)"
        progressLabel.text = "\(questionNumber + 1 ) / 10"
        
    }
    //Funtion next Question
    func nextQuestion() {
        if questionNumber <= 9{
            
          questionLabel.text = allQuestions.list[questionNumber].questionText
            
          updateUI()
        }else{
            
           let alert = UIAlertController(title: "Congratulation!", message: "You finished ZenQuiz", preferredStyle: .alert)
           
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
            {(UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    //Funtion which checks right answer
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            print("")
            score = score + 1
        }
        
    }
    //Funtion which starts over Quiz
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
    }
}
