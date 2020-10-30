//
//  BaseViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.addNaviCustom()
    }
    

}
