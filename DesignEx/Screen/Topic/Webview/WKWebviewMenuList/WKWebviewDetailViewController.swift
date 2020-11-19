//
//  WKWebviewDetailViewController.swift
//  DesignEx
//
//  Created by Miichisoft on 10/30/20.
//

import UIKit
import WebKit
class WKWebviewDetailViewController: BaseViewController {
    @IBOutlet weak var webview: WKWebView!
    var url : URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webview.navigationDelegate = self
        self.webview.load(URLRequest(url: url!))
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [self] (timer) in
            webview.evaluateJavaScript("document.getElementsByClassName(\"header\")[0].style.display = 'none'") { (resut, error) in
                
            }
        }
        
    }
   



}
extension WKWebviewDetailViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webview.evaluateJavaScript("document.getElementsByClassName(\"header\")[0].style.display = 'none'") { (resut, error) in
            
        }
    }
}
