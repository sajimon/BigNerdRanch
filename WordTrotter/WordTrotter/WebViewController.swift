//
//  WebViewController.swift
//  WordTrotter
//
//  Created by Marcin Sporysz on 05.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
        
    var webView: WKWebView!
    
    
    
    override func loadView(){
        webView = WKWebView()
        webView.navigationDelegate = self
        
        view = webView
        
//        let topConstraint = webView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
//        let bottomConstraint = webView.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: 8)
        

        
//        topConstraint.active = true
//        bottomConstraint.active = true

        print("Web View loading...")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Web View loaded.")
        
        let url = NSURL(string: "https://google.pl")
        let req = NSURLRequest(URL: url!)
        
        webView.loadRequest(req)
        
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
//        print("Web View will appear.")
//        print("Web View loading page \(webView.loading)")
    }
    
    
    //MARK:- WKNavigationDelegate
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error.localizedDescription)
    }
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("finish to load")
    }
}
