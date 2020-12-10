//
//  URL + extension.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/30/20.
//

import Foundation
import UIKit
extension URL {
    func getImage(result : @escaping (UIImage)->Void){
        do { let data : Data =
            try Data(contentsOf: self)
            if let image : UIImage = UIImage(data: data){
                result(image)
            }
        } catch let  error  as NSError{
            print(error)
        }
    }
    func loadImageURL (imageView : UIImageView){
        URLSession.shared.dataTask(with: self) { (data, responce, error) in
            let image = UIImage(data: data!)
            imageView.image = image
        }
        URLSession.shared.dataTask(with: URL(fileURLWithPath: "")) { (data, responce, error) in
            print(error!)
        }
    }
}
