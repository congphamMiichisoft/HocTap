//
//  UIViewController + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import Foundation
import UIKit
extension UIViewController {
    func getnameClass(name : String? = nil)->String{
        return name == nil ? String(describing: type(of: self)) : name as! String
    }
    func addNaviCustom(){
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 56))
        header.backgroundColor = .red
        self.view.addSubview(header)
//        header.translatesAutoresizingMaskIntoConstraints = false
        header.action = {
            self.navigationController?.popViewController(animated: true)
        }
    }
   
}
