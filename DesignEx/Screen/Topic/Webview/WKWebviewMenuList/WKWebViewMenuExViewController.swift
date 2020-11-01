//
//  WKWebViewViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import UIKit

class WKWebViewMenuExViewController: BaseViewController {
    var listMenu = [Menu]()
    @IBOutlet var tableview : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: FunctionTableViewCell.init().iditifile, bundle: nil), forCellReuseIdentifier: FunctionTableViewCell.init().iditifile)
        tableview.delegate = self
        tableview.dataSource = self
        configMenu()
    }
    func configMenu(){
        self.listMenu.append(Menu(name: "Xã hội", link: "https://docbao.vn/xa-hoi"))
        self.listMenu.append(Menu(name: "Giải trí", link: "https://docbao.vn/giai-tri"))
        self.listMenu.append(Menu(name: "Kinh tế", link: "https://docbao.vn/kinh-te"))
        self.listMenu.append(Menu(name: "Thể thao", link: "https://docbao.vn/the-thao"))
        
    }

}
extension WKWebViewMenuExViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: FunctionTableViewCell.init().iditifile, for: indexPath) as! FunctionTableViewCell
        cell.titleLB.text = self.listMenu[indexPath.row].name!
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scr = WKWebviewDetailViewController()
        scr.url = self.listMenu[indexPath.row].url!
        self.navigationController?.pushViewController(scr, animated: true)
    }
    
    
}
class Menu {
    var name : String!
    var url : URL!
    init() {
        
    }
    init(name : String , link : String) {
        self.name = name
        self.url = URL(string: link)
    }
}
