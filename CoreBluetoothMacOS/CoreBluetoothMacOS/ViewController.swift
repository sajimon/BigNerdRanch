//
//  ViewController.swift
//  CoreBluetoothMacOS
//
//  Created by Marcin Sporysz on 21.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import Cocoa
import CoreBluetooth

class ViewController: NSViewController, CBCentralManagerDelegate, CBPeripheralDelegate, NSTableViewDelegate {
    
    
    var manager: CBCentralManager!
    var peripherialsDataSource: PeripherialsTableDataSource!
    var selectedPeripherial: CBPeripheral? {
        didSet {
            if selectedPeripherial == nil {
                connectButton.enabled = false
            }else {
                connectButton.enabled = true
            }
        }
    }
    
    
    @IBOutlet var table: NSTableView!
    @IBOutlet var connectButton: NSButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CBCentralManager(delegate: self, queue: nil)
        peripherialsDataSource = PeripherialsTableDataSource()
        
        table.setDataSource(peripherialsDataSource)
        table.setDelegate(self)
        
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
        if peripherialsDataSource.indexOfPeripherial(peripheral) == nil {
            peripherialsDataSource.addPeripherial(peripheral)
            table.reloadData()
            print("Discovered periherial: \(peripheral.name)")
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
            print("Service UUID: \(service.UUID.UUIDString)")
            
            if let characteristics = service.characteristics {
                for ch in characteristics {
                    print("\t \(ch.UUID)")
                }
            }else {
                print("\t No characteristics detected.")
            }
            
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
        
        if let p = selectedPeripherial {
            print("Connecting to: \(p.name)")
            
            manager.connectPeripheral(p, options: nil)
        }
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let p = peripherialsDataSource.periphs[row]
        
        var pn: String
        
        if let name = p.name {
            pn = name
        } else {
            pn = "NN"
        }

        if let c = tableView.makeViewWithIdentifier("PeriphCellID", owner: nil) as? NSTableCellView {
            c.textField?.stringValue = pn
            return c
        }

        return nil
    }
    
    func tableViewSelectionDidChange(notification: NSNotification) {
        if table.numberOfSelectedRows > 0 {
            selectedPeripherial = peripherialsDataSource.periphs[table.selectedRow]
        } else {
            selectedPeripherial = nil
        }
    }

    

}

