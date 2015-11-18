//
//  QuizStructs.swift
//  iQuiz
//
//  Created by iGuest on 11/17/15.
//  Copyright © 2015 Jason Ho. All rights reserved.
//

import Foundation

struct Quiz {
    let title:String
    let desc:String
    let questions:[Question]
    
    var currQuestion:Int = 0
    
    init(title:String, description:String, questions:[Question]) {
        self.title = title
        self.desc = description
        self.questions = questions
    }
    
    public func getCurrentQuestion() -> Question {
        return questions[currQuestion]
    }
}

struct Question {
    let text:String
    let correctAnswer:Int
    let ans1:Answer
    let ans2:Answer
    let ans3:Answer
    let ans4:Answer
    
    init(questionText:String, ans1:Answer, ans2:Answer, ans3:Answer, ans4:Answer, correctAnswer:Int) {
        self.text = questionText
        self.ans1 = ans1
        self.ans2 = ans2
        self.ans3 = ans3
        self.ans4 = ans4
        self.correctAnswer = correctAnswer
    }
}

struct Answer {
    let text:String
    
    init(answerText:String) {
        self.text = answerText
    }
}