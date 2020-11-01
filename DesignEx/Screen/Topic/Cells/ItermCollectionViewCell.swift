//
//  ItermCollectionViewCell.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/30/20.
//

import UIKit

class ItermCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbBaget: PaddingLabel!
    var item : Topic! {
        didSet{
            if item.barget != nil && item.barget > 0 {
                self.lbBaget.isHidden = false
                self.lbBaget.text = item.barget! > 10 ? "\(item.barget!)" : "0\(item.barget!)"
            }else {
                self.lbBaget.isHidden = true
            }
            self.lbTitle.text = item.name!
            self.imgIcon.loadImageFromURLString(string: self.item.imageuUrl)
        }
    }
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lbTitle: PaddingLabel!
    @IBOutlet weak var viewMain: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSubviews() {
        self.viewMain.layer.cornerRadius = 10
        self.viewMain.layer.masksToBounds = true
        lbBaget.layer.cornerRadius = lbBaget.layer.frame.height/2
        lbBaget.layer.masksToBounds = true
        lbTitle.shadowDecorate()
        lbTitle.layer.cornerRadius = 5
        lbTitle.clipsToBounds = true
        lbTitle.layer.borderWidth = 0.1
        lbTitle.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
    }
    
}
