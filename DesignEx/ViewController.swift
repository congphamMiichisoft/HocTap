//
//  ViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    let cellname = "FunctionTableViewCell"
    let cellID = "FunctionTableViewCell"
    var listFunc = [Iterm]()
   
    func addFunction(){
        listFunc.append(Iterm(controller: HiddenStatusBarViewController(),name: "Hidden Header when scroll"))
        listFunc.append(Iterm(controller: WKWebViewViewController(),name: "WKWebView Example"))
    }

}




