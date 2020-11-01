//
//  BaseViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(back))
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
//        self.addNaviCustom()
    }
    func configShowHideKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    

}
