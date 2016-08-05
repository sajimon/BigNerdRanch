//
//  ConversionViewController.swift
//  WordTrotter
//
//  Created by Marcin Sporysz on 03.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var farValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celValue: Double? {
        if let value = farValue
        {
            return (value - 32) * (5/9)
        }else
        {
            return nil
        }
    }
    
    let numFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 1
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    let charSet: NSCharacterSet = {
        let n = NSCharacterSet.decimalDigitCharacterSet();
        return n
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Convert View loaded.")
    }
    
    override func viewWillAppear(animated: Bool) {
        
        print("Convert View will appear...")
        
//        let bgColor = UIColor.init(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
        
//        view.backgroundColor = bgColor;
        
    }
    
    @IBAction func fahrenheitFielsEditingChanged(textField: UITextField)
    {
        if let text = textField.text, value = Double(text)
        {
            farValue = value
        }else
        {
            farValue = nil
        }
    }

    @IBAction func dismissKeyboard(sender: AnyObject)
    {
        textField.resignFirstResponder();
    }
    
    func updateCelsiusLabel()
    {
        if let value = celValue
        {
            celsiusLabel.text = numFormatter.stringFromNumber(value)
        }else
        {
            celsiusLabel.text = "---"
        }
    }
    
    //BEGIN TestFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        
        print("Current text: \(textField.text)")
        print("Replacement text: \(string)")
        
        let existingTextHasDecimal = textField.text?.rangeOfString(".")
        let replacementTextHasDecimal = string.rangeOfString(".")
        
        if existingTextHasDecimal != nil && replacementTextHasDecimal != nil {
            print("Blocked!");
            return false
        }else {
            return true
        }
    }
    
    //END TextFieldDelegate
    
}