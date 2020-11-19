//
//  String + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/30/20.
//

import Foundation
extension String {
    func  url()->URL! {
        return URL(string: self)
    }
}
