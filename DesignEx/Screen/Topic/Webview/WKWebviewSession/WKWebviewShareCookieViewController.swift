//
//  WKWebviewShareCookieViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 19/11/2020.
//

import UIKit
import WebKit
class WKWebviewShareCookieViewController: UIViewController {
    @IBOutlet weak var stMain: UIStackView!
    var webview1 : WKWebView!
    var webview2 : WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let views : [UIView]? = stMain.subviews else{
            return
        }
        Environment.shared.processPool = WKProcessPool()
        
    }
    


}
