//
//  HeaderView.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/29/20.
//

import UIKit

class HeaderView: UIView {
    var action : (()->Void)?
    @IBOutlet var contentView: UIView!
    override init(frame : CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBAction func back(_ sender: Any) {
        action?()
        
    }
    private func setupView(){
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.frame
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = #colorLiteral(red: 0.9592980894, green: 0.9592980894, blue: 0.9592980894, alpha: 0.8850957306)
    }
    

}
