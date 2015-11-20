//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/10/15.
//  Copyright © 2015 Jason Ho. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //var currQuiz = ""
    //var questionNum = 1
    var correctNum = 0
    var answerButtons : [UIButton] = []
    
    var currQuiz:Quiz? = nil
    var question = Question?()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        navItemQuizTitle.title = currQuiz!.title
        question = currQuiz!.getCurrentQuestion()
        
        questionLabel.text = "Question \(currQuiz!.currQuestion + 1)\n\(question!.text)"
        
        ans1Button!.setTitle(question!.ans1.text, forState: UIControlState.Normal)
        ans2Button!.setTitle(question!.ans2.text, forState: UIControlState.Normal)
        ans3Button!.setTitle(question!.ans3.text, forState: UIControlState.Normal)
        ans4Button!.setTitle(question!.ans4.text, forState: UIControlState.Normal)
        
        answerButtons = [ans1Button, ans2Button, ans3Button, ans4Button]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func quitPress(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("quitSegue", sender: nil)
    }
    
    @IBAction func answerPress(sender: UIButton) {
        sender.selected = true
        for button in answerButtons {
            if button != sender {
                button.selected = false
            }
        }
    }
    
    @IBAction func continuePress(sender: UIButton) {
        var selectedButton:UIButton? = nil
        for button in answerButtons {
            if button.selected {
                selectedButton = button
            }
        }
        
        if selectedButton != nil {
            self.performSegueWithIdentifier("correctIncorrectSegue", sender: selectedButton!)
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "correctIncorrectSegue" {
            let destinationVC:CorrectIncorrectViewController = segue.destinationViewController as! CorrectIncorrectViewController
            
            destinationVC.correctNum = self.correctNum
            destinationVC.currQuiz = self.currQuiz
            destinationVC.answer = (sender!.titleLabel!!.text)!
        }
    }
    
    @IBOutlet weak var navItemQuizTitle: UINavigationItem!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var ans1Button: UIButton!
    @IBOutlet weak var ans2Button: UIButton!
    @IBOutlet weak var ans3Button: UIButton!
    @IBOutlet weak var ans4Button: UIButton!
}
