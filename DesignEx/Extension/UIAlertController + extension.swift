//
//  UIAlertController + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 11/1/20.
//

import Foundation
import UIKit
extension UIAlertController{
   class func initAlert(title : String, mess : String, actionOK : @escaping()->Void, actionCancel : @escaping ()->Void)->UIAlertController{
        let alert = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (btnOK) in
            actionOK()
        }))
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: { (btnCancel) in
            actionCancel()
        }))
        return alert
    }
}
