//
//  ViewController + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import Foundation
import UIKit
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listFunc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as!  FunctionTableViewCell
//        cell.title.text = listFunc[indexPath.item].getnameClass()
        cell.titleLB.text = listFunc[indexPath.item].genName()
        return cell
    }
    
    
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scr = listFunc[indexPath.item].controller
        scr?.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(scr!, animated: true)
    }
}
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
        self.tableview?.register(UINib(nibName: cellname, bundle: nil), forCellReuseIdentifier: cellID)
        self.addFunction()
    }
}
class Iterm{
    var name : String!
    var controller : UIViewController!
    init() {
        
    }
    init(controller : UIViewController,name : String? = nil) {
        self.name = name
        self.controller = controller
    }
    func genName()->String {
        if name != nil {
           return name
        }else {
            return controller.getnameClass()
        }
    }
}
