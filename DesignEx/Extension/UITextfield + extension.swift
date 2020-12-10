//
//  UITextfield + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 05/12/2020.
//

import Foundation
import UIKit
    extension UITextField {
        func setLeftPaddingPoints(_ amount:CGFloat){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        func setRightPaddingPoints(_ amount:CGFloat) {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
        func padding(pading : CGRect){
            
        }
    }

