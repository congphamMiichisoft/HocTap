//
//  WKWebSessionViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 19/11/2020.
//

import UIKit
import WebKit
class WKWebSessionViewController: UIViewController {
    var webview : WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webview = WKWebView(frame: view.frame)
        view.addSubview(webview)
        webview.load(URLRequest(url: URL(string: "https://myaccount.google.com/personal-info")!))
        let detail = UIBarButtonItem(title: "Detail", style: .plain, target: self, action: #selector(action))
        let share = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareCC))
        self.navigationItem.rightBarButtonItems = [detail,share]
    }
    @objc func action(){
        let scr = WKWebSessionDetailViewController()
        self.navigationController?.pushViewController(scr, animated: true)
    }
    @objc func shareCC(){
        let scr = WKWebviewShareCookieViewController()
        self.navigationController?.pushViewController(scr, animated: true)
    }


}
