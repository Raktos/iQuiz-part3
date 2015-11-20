//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/19/15.
//  Copyright © 2015 Jason Ho. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadQuizzes() {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let url = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        
        let downloadTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            print(error)
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            print(statusCode)
            self.saveQuizes(data!)
        }
        
        downloadTask.resume()
    }
    
    func saveQuizes(quizzes: NSData) {
        let jsonPath = NSBundle.mainBundle().pathForResource("quizzes", ofType: "json")
        quizzes.writeToFile(jsonPath!, atomically: true)
    }
    
    @IBAction func downloadButtonPress(sender: UIButton) {
        downloadQuizzes()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
