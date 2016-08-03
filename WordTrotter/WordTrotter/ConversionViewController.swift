//
//  ConversionViewController.swift
//  WordTrotter
//
//  Created by Marcin Sporysz on 03.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
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
    
}