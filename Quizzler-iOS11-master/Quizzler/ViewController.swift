//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
	let allQuestions = QuestionBank()
	var pickedAnswer:Bool = false
	var questionNumber:Int = 0
	var score:Int = 0
	var numQuestions:Int = 0
	
	let correctIndicators = ["Yep", "Good", "You got it!", "Correct", "Nice job", "Yes!", "Boom."]
	let incorrectIndicators = ["Nope", "Bummer", "That couldn't be more wrong", "Just... no.", "Fail.", "Seriously?", "omg", "You should stop.", "You get a lot of these wrong."]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		numQuestions = allQuestions.list.count
		
		updateUI()
		nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
		if sender.tag == 1 {
			pickedAnswer = true
		}
		else if sender.tag == 2 {
			pickedAnswer = false
		}
		
		checkAnswer()
		questionNumber += 1
		nextQuestion()
    }
	
	func isQuestionWithinRange(num:Int, total:Int) -> Bool {
		return num < total
	}
	
    func updateUI() {
		scoreLabel.text = "Score: \(score)"
		
		if isQuestionWithinRange(num: questionNumber+1, total: numQuestions+1) {
			progressLabel.text = "\(questionNumber+1) / \(numQuestions)"
		}
		
		progressBar.frame.size.width = (view.frame.size.width / CGFloat(numQuestions)) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
		if isQuestionWithinRange(num: questionNumber, total: numQuestions) {
			questionLabel.text = allQuestions.list[questionNumber].questionText
			updateUI()
		}
		else {
			let alert = UIAlertController(title: "You're done", message: "You've finished the quiz. Do you want to start over?", preferredStyle: .alert)
			let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIActionAlert) in
				self.startOver()
			})
			
			alert.addAction(restartAction)
			
			present(alert, animated: true, completion: nil)
		}
    }
    
    
    func checkAnswer() {
		let correctAnswer = allQuestions.list[questionNumber].answer
		
		if correctAnswer == pickedAnswer {
			score += 1
			
			let randomIndex = Int(arc4random_uniform(UInt32(correctIndicators.count)))
			let text = correctIndicators[randomIndex]

			ProgressHUD.showSuccess(text)
		}
		else {
			let randomIndex = Int(arc4random_uniform(UInt32(incorrectIndicators.count)))
			let text = incorrectIndicators[randomIndex]

			ProgressHUD.showError(text)
		}

		updateUI()
    }
    
    
    func startOver() {
		questionNumber = 0
		score = 0
		updateUI()
		nextQuestion()
    }
    

    
}
