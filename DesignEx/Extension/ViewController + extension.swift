//
//  ViewController + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import Foundation
import UIKit

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
