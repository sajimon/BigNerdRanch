//
//  ItemStore.swift
//  Homepwner
//
//  Created by Marcin Sporysz on 10.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
 
    init() {
        for _ in 0..<5 {
            let item = createItem()
            item.printToConsole()
        }
    }
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}