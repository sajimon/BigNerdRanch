//
//  PeripherialOutlineViewDataSource.swift
//  OutlineViewTests
//
//  Created by Marcin Sporysz on 22/08/16.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import Foundation
import Cocoa
import CoreBluetooth

class PeripherialOutlineViewDataSource: NSObject, NSOutlineViewDataSource {

    
    var periphs: [CBPeripheral] = []
    
    
    func generateExampleData() {
        
        for _ in 0..<10 {
            let p = CBPeripheral()
            
            periphs.append(p)
        }
    }
    
    //MARK: - NSOutlineViewDataSource methods.
    func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int {
        return periphs.count
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        
        
        return false
    }
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject {
        return "Marcin"
    }
    
    
    
    
}