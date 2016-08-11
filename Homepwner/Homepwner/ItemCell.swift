//
//  ItemCell.swift
//  Homepwner
//
//  Created by Marcin Sporysz on 11.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
 
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont

        let captionFont = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        serialNumberLabel.font = captionFont
        
    }
    
    func updateValueLabelColor(value: Int) {
        if value < 50 {
            valueLabel.textColor = UIColor.greenColor()
        }else {
            valueLabel.textColor = UIColor.redColor()
        }
        
    }
    
}
