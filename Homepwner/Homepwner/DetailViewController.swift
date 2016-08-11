//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Marcin Sporysz on 11.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    
    
    var imageStore: ImageStore!
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    @IBAction func trashPicture(sender: UIBarButtonItem) {
        imageView.image = nil
        imageStore.deleteImageForKey(item.itemKey)
    }
    
    @IBAction func backgroudTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func takePicture(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
        }else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
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
        
        let key = item.itemKey
        
        let imageToDisplay = imageStore.imageForKey(key)
        imageView.image = imageToDisplay
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
    
    //Camera methods
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageStore.setImage(image, forKey: item.itemKey)
        
        imageView.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
