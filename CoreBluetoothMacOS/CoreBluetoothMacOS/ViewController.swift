//
//  ViewController.swift
//  CoreBluetoothMacOS
//
//  Created by Marcin Sporysz on 21.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import Cocoa
import CoreBluetooth

class ViewController: NSViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    
    var manager: CBCentralManager!
    
    var periphs: [CBPeripheral] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CBCentralManager(delegate: self, queue: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    //MARK: - Central Manager Delegate methods.
    func centralManagerDidUpdateState(central: CBCentralManager) {
        print("CBManager statre update: \(central.state.rawValue)")
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        print("Discovered periherial: \(peripheral.name) Services count: \(peripheral.services?.count)")
        
        if periphs.indexOf(peripheral) == nil {
            periphs.append(peripheral)
            print("Added peripherial \(peripheral)")
        }
    }
    
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        
        peripheral.delegate = self
        peripheral.discoverServices(nil)
        
    }
    
    //MARK: - Peripherial protocol methods.
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        print("Available services:")
        
        for service in peripheral.services! {
            print("UUID: \(service.UUID.UUIDString)")
            //todo
        }
    }
    
    //MARK: - UI Methods.
    @IBAction func startScanningClicked(sender: NSButton) {
        print("Start scanning...")
        manager.scanForPeripheralsWithServices(nil, options: nil)
    }
    
    @IBAction func stopScanningClicked(sender: NSButton) {
        print("Stop scanning...")
        manager.stopScan()
    }
  
    @IBAction func connectClicked(sender: AnyObject) {
        if periphs.count > 0 {
            let p = periphs.first!
            
            manager.connectPeripheral(p, options: nil)
        }
    }
}

