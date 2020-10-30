//
//  UItableViewCell + extension.swift
//  DesignEx
//
//  Created by Miichisoft on 10/30/20.
//

import Foundation
import UIKit
extension UITableViewCell {
    var iditifile : String! {
        return String(describing: type(of: self))
    }
}
