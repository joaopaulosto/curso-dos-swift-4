//
//  ViewController.swift
//  LayoutComFVL
//
//  Created by João Paulo Scopus on 04/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    
    let sites = ["https://www.google.com.br", "https://www.facebook.com", "https://www.apple.com/"]
    var currentWebsite = 0
    
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        
        let myURL = URL(string: "https://www.google.com.br")
        let myResq = URLRequest(url: myURL!)
        
        
        webView.load(myResq)
        
        webView.uiDelegate = self
        

        //add subviews to superview
        self.view.addSubview(webView)
        
        
        
        //remove any constraints in interface builder
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //build dinctionary of views
        let viewsDict = ["webView": webView];
        
        //build array to store constraints
        var viewConstraints = [NSLayoutConstraint]()
    
        
        //creates horizontal constraints
        let horizontalConstrants = NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|", options: [], metrics: nil, views: viewsDict)
        
        //creates vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += verticalConstraints
        viewConstraints += horizontalConstrants
        
        //active all constraints
        self.view.addConstraints(viewConstraints)
        
        //NSLayoutConstraint.activate(viewConstraints)
        compileRules()

    }
    func compileRules() {
        WKContentRuleListStore.default().compileContentRuleList(forIdentifier: "MyBlock",
                                                                encodedContentRuleList: loadFromBundle()!) { [weak self] rules, error in
                                                                    self?.loadWebsite()
        }
        
    }
    func loadWebsite(){
        
        WKContentRuleListStore.default().lookUpContentRuleList(forIdentifier: "MyBlock",
                                                               completionHandler: { [weak self] rules, error in
                                                                
                                                                if error != nil { return }
                                                                self?.webView.configuration.userContentController.add(rules!)
                                                                
                                                                if let currentWebsite = self?.currentWebsite, let sites = self?.sites {
                                                                    let request = URLRequest(url: URL(string: sites[currentWebsite])!)
                                                                    self?.webView.load(request)
                                                                }
                                                                
        })
        
    }
    func loadFromBundle() -> String? {
        
        return """
        [
        {
        "trigger": {
        "url-filter": ".*",
        "resource-type": ["image","style-sheet"]
        },
        "action": {
        "type": "make-https"
        }
        },
        {
        "trigger": {
        "url-filter": ".*",
        "if-domain": ["www.google.com.br", "www.scopus.com.br"]
        },
        "action": {
        "type": "block"
        }
        }
        ]

        """
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

