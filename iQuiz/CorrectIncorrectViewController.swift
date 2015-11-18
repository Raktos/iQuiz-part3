//
//  CorrectIncorrectViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/10/15.
//  Copyright © 2015 Jason Ho. All rights reserved.
//

import UIKit

class CorrectIncorrectViewController: UIViewController {
    var answer = ""
    
    var currQuiz:Quiz? = nil
    var question:Question? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
        
        question = currQuiz?.getCurrentQuestion()
        
        correctLabel.text = "You got it wrong!"
        questionLabel.text = question!.text
        correctAnswerLabel.text = question.answers[question!.correctAnswer]
        
        if answer == "Answer1" {
            correctNum++
            correctLabel.text = "You got it right!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPress(sender: UIButton) {
        questionNum++
        
        if questionNum > 20 {
            self.performSegueWithIdentifier("finishSegue", sender: self)
        } else {
            self.performSegueWithIdentifier("nextQuestionSegue", sender: self)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "finishSegue" {
            let destinationVC:FinishViewController = segue.destinationViewController as! FinishViewController
            destinationVC.correctNum = self.correctNum
            destinationVC.currQuiz = self.currQuiz
            
        } else if segue.identifier == "nextQuestionSegue" {
            let destinationVC:QuestionViewController = segue.destinationViewController as! QuestionViewController
            destinationVC.correctNum = self.correctNum
            destinationVC.questionNum = self.questionNum
            destinationVC.currQuiz = self.currQuiz
        }
    }

    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
}
