//
//  ViewController.swift
//  Quiz
//
//  Created by Marcin Sporysz on 22.07.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!

    let questions: [String] = ["Fromwhat is cognac mage?",
                               "Whats is 7+7?",
                               "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes",
                            "14",
                            "Montpelier"]

    
    var currentQuestionIndex: Int = 0
    
    
    
    @IBAction func showNextQuestion(sender: AnyObject)
    {
        
    }
    
    @IBAction func showAnswer(sender: AnyObject)
    {
    
    }
    
}

