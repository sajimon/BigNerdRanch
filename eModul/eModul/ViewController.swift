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
        
        webView = WKWebView(frame: CGRectZero, configuration: webViewConfiguration)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(webView)
        
        webView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
        webView.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor).active = true
        webView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor).active = true
        webView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor).active = true
     

        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
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

