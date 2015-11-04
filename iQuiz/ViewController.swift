//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/3/15.
//  Copyright © 2015 Jason Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
    
    private let descriptions = ["Maths quizzes on maths.", "Superhero quizzes on Marvel.", "Science quizzes on science."]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as UITableViewCell?
        
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

    @IBAction func settingsPress(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "SETTINGS GO HERE", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
        alert.addAction(alertAction)
        presentViewController(alert, animated: true) { () -> Void in }
    }

}

