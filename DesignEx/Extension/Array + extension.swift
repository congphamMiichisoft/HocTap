//
//  Array + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 05/12/2020.
//

import Foundation
import UIKit
extension Array {
    func getminLengthString()->CGFloat {
        var min = CGFloat(0)
        for item in self {
             let string: String = item as! String
               let size =  string.width(withConstrainedHeight: 17, font: UIFont.systemFont(ofSize: 17))
                if min < size {
                    min = size
                }
            
        }
        return min

    }
}
