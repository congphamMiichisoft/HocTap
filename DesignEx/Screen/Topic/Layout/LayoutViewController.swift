//
//  LayoutViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 02/12/2020.
//

import UIKit
import LicensePlistViewController
class LayoutViewController: UIViewController {
    var tabbleview : UITableView = {
        let tabble = UITableView()
        tabble.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tabble
    }()
    var listVc : [Iterm] = {
        var list = [Iterm]()
        list.append(Iterm(controller: HiddenStatusBarViewController(), name: "Hidden Statusbar"))
        list.append(Iterm(controller: LicensePlistViewController(fileNamed: "Root"), name: "List Linese plist"))
        return list
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabbleview)
        tabbleview.delegate = self
        tabbleview.dataSource = self
        tabbleview.frame = view.bounds
        
    }

}
extension LayoutViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listVc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listVc[indexPath.row].name != nil ? listVc[indexPath.row].name : listVc[indexPath.row].controller.getnameClass()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = listVc[indexPath.row].controller
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
