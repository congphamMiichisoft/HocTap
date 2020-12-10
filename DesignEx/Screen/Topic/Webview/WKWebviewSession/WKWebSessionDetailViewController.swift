//
//  WKWebSessionDetailViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 19/11/2020.
//

import UIKit
import WebKit
class WKWebSessionDetailViewController: UIViewController {
    var tapCount : Int = 0
    var webview : WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webview = WKWebView(frame: view.frame)
        view.addSubview(webview)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(action))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapWebview) )
        tapGesture.delegate = self
        webview.navigationDelegate = self
        tapGesture.numberOfTapsRequired = 1
        webview.addGestureRecognizer(tapGesture)
        
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webview.load(URLRequest(url: URL(string: "https://myaccount.google.com/personal-info")!))
    }
    @objc func action(){
        webview.reload()
    }
    @objc func tapWebview (){
        tapCount += 1
        print("tap on webview \(tapCount)")
    }
    
}
extension WKWebSessionDetailViewController : UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
extension WKWebSessionDetailViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      
    }
}
