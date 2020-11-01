//
//  WKWebviewMainDatasource.swift
//  DesignEx
//
//  Created by CONG PHAM on 11/1/20.
//

import Foundation
import UIKit
class WKWebviewMainDatasource : NSObject, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FunctionTableViewCell.init().iditifile, for: indexPath) as! FunctionTableViewCell
        cell.titleLB.text = self.listMenu[indexPath.row].genName()
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scr = listMenu[indexPath.item].controller!
        delegate?(scr)
    }
    var listMenu : [Iterm]{
        var listItem = [Iterm]()
        listItem.append(Iterm(controller: WKWebViewMenuExViewController(),name: "Hidden Menu in Header of Website"))
        listItem.append(Iterm(controller: WKWebViewMenuExViewController()))
        return listItem
    }
    var delegate  : ((UIViewController)->Void)?
        
    
    
    
}

