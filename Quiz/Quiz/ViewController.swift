//
//  ViewController.swift
//  Quiz
//
//  Created by Marcin Sporysz on 22.07.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
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
        currentQuestionIndex += 1;
        if currentQuestionIndex == questions.count
        {
            currentQuestionIndex = 0;
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???";
        
        animateLabelTransitions()
        
    }
    
    @IBAction func showAnswer(sender: AnyObject)
    {
        answerLabel.text = answers[currentQuestionIndex];
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
        
    }
    
    func updateOffScreenLabel(){
        let scrWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -scrWidth
    }
    
    
    func animateLabelTransitions() {
        
        view.layoutIfNeeded()
        
        let scrWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += scrWidth
        
        UIView.animateWithDuration(0.5,
                                   delay: 0,
                                   options: [ .CurveLinear ],
                                   animations: {
                                    self.currentQuestionLabel.alpha = 0
                                    self.nextQuestionLabel.alpha = 1
                                    
                                    self.view.layoutIfNeeded()
            
            
            },
                                   completion: { _ in
                                    swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                                    swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                                    
                                    self.updateOffScreenLabel()
        })
    }
    
    
    
}

