//
//  UIImageView + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 11/1/20.
//

import Foundation
import UIKit
extension UIImageView {
    func loadImageFromURLString(string : String){
        guard let url : URL = URL(string: string) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }.resume()
    }
}
