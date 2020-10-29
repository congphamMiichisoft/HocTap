//
//  FunctionTableViewCell.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import UIKit

class FunctionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLB: UILabel! {
        didSet {
            titleLB.textColor = .black
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
