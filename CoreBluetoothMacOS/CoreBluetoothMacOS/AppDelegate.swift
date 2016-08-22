//
//  AppDelegate.swift
//  CoreBluetoothMacOS
//
//  Created by Marcin Sporysz on 21.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
//        let vc = NSApplication.sharedApplication().mainWindow?.windowController?.contentViewController as! ViewController
//        vc.peripherialsDataSource = PeripherialsTableDataSource()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

