//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/3/15.
//  Copyright © 2015 Jason Ho. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //@IBOutlet weak var tableView: UITableView!
    
    //private let subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
    
    //private let descriptions = ["Maths quizzes on maths.", "Superhero quizzes on Marvel.", "Science quizzes on science."]
    
    private let simpleTableIdentifier = "SimpleTableIdentifier"
    private var currQuiz:Quiz? = nil
    private var quizzes:[Quiz] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell?
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
        }
        
        //let image = UIImage(named: "star")
        //cell!.imageView?.image = image
        
        cell!.textLabel?.text = quizzes[indexPath.row].title
        cell!.detailTextLabel?.text = quizzes[indexPath.row].desc
        cell!.imageView?.image = UIImage(named: /*subjects[indexPath.row]*/"image.jpg")
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func readQuizzesFromJson() {
        let jsonPath = NSBundle.mainBundle().pathForResource("quizzes", ofType: "json")
        do {
            let jsonData = try NSData(contentsOfFile: jsonPath!, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let jsonQuizzes = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            
            //get each quiz from the JSON
            for quiz in jsonQuizzes as! [NSDictionary] {
                //create an array of all the qustions for this quiz
                var questions = [Question]()
                //get each question from the JSON
                for question in quiz["questions"] as! [NSDictionary]{
                    //create an array of answers for this question
                    var answers = [Answer]()
                    //get each answer from the JSON
                    for answer in question["answers"] as! [String] {
                        //add this answer
                        answers.append(Answer(answerText: answer))
                    }
                    //add this question
                    let thisQuestion = Question(questionText: question["text"] as! String, ans1: answers[0], ans2: answers[1], ans3: answers[2], ans4: answers[3], correctAnswer: question["answer"] as! Int)
                    questions.append(thisQuestion)
                }
                //add this quiz
                let thisQuiz = Quiz(title: quiz["title"] as! String, description: quiz["desc"] as! String, questions: questions)
                self.quizzes.append(thisQuiz)
            }
        } catch {
            //catch any errors reading the JSON
        }
    }
    
    @IBAction func settingsPress(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "SETTINGS GO HERE", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
        alert.addAction(alertAction)
        presentViewController(alert, animated: true) { () -> Void in }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currQuiz = quizzes[indexPath.row]
        
        self.performSegueWithIdentifier("showQuestionsSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC:QuestionViewController = segue.destinationViewController as! QuestionViewController
        destinationVC.currQuiz = self.currQuiz
    }
}