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
        return name == nil ? String(describing: type(of: self)) : name!
    }
    func addNaviCustom(){
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 56))
        header.backgroundColor = .red
        self.view.addSubview(header)
        header.frame.origin.y += 40
//        header.translatesAutoresizingMaskIntoConstraints = false
        header.action = {
            self.navigationController?.popViewController(animated: true)
        }
//        self.view.translatesAutoresizingMaskIntoConstraints = false
        
    }

    func configMainView(childview : UIView){
    }
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }

    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
   
}

