//
//  ViewController.swift
//  eModul
//
//  Created by Marcin Sporysz on 14/08/16.
//  Copyright © 2016 TECH Sterowniki. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WKWebView!

    
    override func loadView() {
        super.loadView()
        
        let webSiteDataStore = WKWebsiteDataStore.defaultDataStore()
        let webViewConfiguration = WKWebViewConfiguration()
        webViewConfiguration.websiteDataStore = webSiteDataStore
        
        webView = WKWebView(frame: view.frame, configuration: webViewConfiguration)
        
//        webView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
        
        view.addSubview(webView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        let url = NSURL(string: "https://emodul.eu/")
        let urlRequest = NSURLRequest(URL: url!)
        
        webView.loadRequest(urlRequest)
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

