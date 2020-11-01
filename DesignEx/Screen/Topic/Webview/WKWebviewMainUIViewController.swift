//
//  WKWebviewMainUIViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 11/1/20.
//

import UIKit

class WKWebviewMainUIViewController: BaseViewController {
    @IBOutlet weak var tableview: UITableView!
    var listFunc = [Iterm]()
    var wkwebviewMainDatasource = WKWebviewMainDatasource()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview?.delegate = wkwebviewMainDatasource
        tableview?.dataSource = wkwebviewMainDatasource
        self.tableview?.register(UINib(nibName: FunctionTableViewCell.init().iditifile, bundle: nil), forCellReuseIdentifier: FunctionTableViewCell.init().iditifile)
        wkwebviewMainDatasource.delegate = {viewcontroller in
            self.navigationController?.pushViewController(viewcontroller, animated: true)
            print("Chuyển màn hình")
        }
        
    }

}


