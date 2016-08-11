//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Marcin Sporysz on 11.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!

    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    @IBAction func backgroudTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    let numberFormatter: NSNumberFormatter = {
        let f = NSNumberFormatter()
        f.numberStyle = .DecimalStyle
        f.minimumFractionDigits = 2
        f.maximumFractionDigits = 2
        return f
    }()
    
    let dateFormatter: NSDateFormatter = {
        var f = NSDateFormatter()
        f.dateStyle = .MediumStyle
        f.timeStyle = .NoStyle
        return f
    }()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialField.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateLabel.text = dateFormatter.stringFromDate(item.dateCreated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.serialNumber = serialField.text
        
        if let valText = valueField.text , value = numberFormatter.numberFromString(valText) {
            item.valueInDollars = value.integerValue
        }else {
            item.valueInDollars = 0
        }
        
        print("Updating item")
        item.printToConsole()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
