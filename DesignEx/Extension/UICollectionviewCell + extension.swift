//
//  UICollectionviewCell + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/30/20.
//

import Foundation
import UIKit
extension UICollectionViewCell {
    var iditifile : String! {
        return String(describing: type(of: self))
    }
    func shadowDecorate() {
            let radius: CGFloat = 10
            contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 0.1
            contentView.layer.borderColor = UIColor.clear.cgColor
            contentView.layer.masksToBounds = true
        
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 1.0)
            layer.shadowRadius = 1.0
            layer.shadowOpacity = 0.5
            layer.masksToBounds = false
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
            layer.cornerRadius = radius
        }
}
