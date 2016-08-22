//
//  PeripherialsTableDataSource.swift
//  CoreBluetoothMacOS
//
//  Created by Marcin Sporysz on 22/08/16.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import Cocoa
import CoreBluetooth


class PeripherialsTableDataSource: NSObject, NSTableViewDataSource {

        var periphs: [CBPeripheral] = []
    
    
    //MARK: - Source Managing methods.
    func addPeripherial(peripherial: CBPeripheral) {
        periphs.append(peripherial)
    }
    
    func indexOfPeripherial(peripherial: CBPeripheral) -> Int? {
        if let p = periphs.indexOf(peripherial) {
            return p
        } else {
            return nil
        }
    }
    
    
    
    //MARK: - TableViewDataSource
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return periphs.count
    }
    
    
    
    

    
}
