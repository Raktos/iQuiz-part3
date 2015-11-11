//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/10/15.
//  Copyright © 2015 Jason Ho. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var currQuiz = ""
    var questionNum = 1
    var correctNum = 0
    var answerButtons : [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navItemQuizTitle.title = currQuiz
        questionLabel.text = "Question \(questionNum)"
        answerButtons = [ans1, ans2, ans3, ans4]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
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
        self.questionNum++
        
        self.performSegueWithIdentifier("correctIncorrectSegue", sender: self)
    }
    
    @IBOutlet weak var navItemQuizTitle: UINavigationItem!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var ans1: UIButton!
    @IBOutlet weak var ans2: UIButton!
    @IBOutlet weak var ans3: UIButton!
    @IBOutlet weak var ans4: UIButton!
}
