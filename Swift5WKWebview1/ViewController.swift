//
//  ViewController.swift
//  Swift5WKWebview1
//
//  Created by 木村友紀 on 2020/04/19.
//  Copyright © 2020 木村友紀. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView.frame = CGRect(x: 0, y:toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height-toolBar.frame.size.height*2)
        
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        let url = URL(string: "https://www.yahoo.co.jp")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("ロード完了")
        indicator.stopAnimating()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
}

