//
//  ViewController.swift
//  OutlineViewTests
//
//  Created by Marcin Sporysz on 22/08/16.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    var olvDataSource = PeripherialOutlineViewDataSource()
    
    @IBOutlet var outlineView: NSOutlineView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        olvDataSource.generateExampleData()
        
        outlineView.setDataSource(olvDataSource)
        outlineView.setDelegate(self)
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


extension ViewController: NSOutlineViewDelegate {
    
}