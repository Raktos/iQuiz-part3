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
    
    private let subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
    
    private let descriptions = ["Maths quizzes on maths.", "Superhero quizzes on Marvel.", "Science quizzes on science."]
    
    private let simpleTableIdentifier = "SimpleTableIdentifier"
    
    private var currQuiz = ""
    
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
        return subjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell?
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
        }
        
        //let image = UIImage(named: "star")
        //cell!.imageView?.image = image
        
        cell!.textLabel?.text = subjects[indexPath.row]
        cell!.detailTextLabel?.text = descriptions[indexPath.row]
        cell!.imageView?.image = UIImage(named: /*subjects[indexPath.row]*/"image.jpg")
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    @IBAction func settingsPress(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "SETTINGS GO HERE", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
        alert.addAction(alertAction)
        presentViewController(alert, animated: true) { () -> Void in }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currQuiz = subjects[indexPath.row]
        
        self.performSegueWithIdentifier("showQuestionsSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC:QuestionViewController = segue.destinationViewController as! QuestionViewController
        destinationVC.currQuiz = self.currQuiz
    }
}