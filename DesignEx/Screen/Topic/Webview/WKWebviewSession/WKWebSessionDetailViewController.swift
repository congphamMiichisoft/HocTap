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
        
        let ud: UserDefaults = UserDefaults.standard
        let data: NSData? = ud.object(forKey: "cookie") as? NSData
            if let cookie = data {
                let datas: NSArray? = NSKeyedUnarchiver.unarchiveObject(with: cookie as Data) as? NSArray
                if let cookies = datas {
                    for c in cookies as! [HTTPCookie] {
                        HTTPCookieStorage.shared.setCookie(c)
                    }
                }
            }
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
        let cookieJar: HTTPCookieStorage = HTTPCookieStorage.shared
        let data: NSData = NSKeyedArchiver.archivedData(withRootObject: cookieJar.cookies) as NSData
        let ud: UserDefaults = UserDefaults.standard
        ud.set(data, forKey: "cookie")
    }
}
