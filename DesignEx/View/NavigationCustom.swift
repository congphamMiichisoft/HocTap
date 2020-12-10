//
//  NavigationCustom.swift
//  DesignEx
//
//  Created by CONG PHAM on 04/12/2020.
//

import UIKit
import SnapKit
class NavigationCustom:  UIView {
    let image = UIImageView()
    let lbTittle = UILabel()
    let button = UIButton()
    var heigthStatus : CGFloat = 0
    var action : ((Bool)->Void)?
    var isPress : Bool = true 
    var didlayout : (()->Void)?
    var search = UITextField()
    var endingSearch : (()->Void)?
    @IBOutlet weak var paddingTopTitle: NSLayoutConstraint!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        search.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView(){
        let window = UIApplication.shared.windows.first
        heigthStatus = (window?.safeAreaInsets.top)!
        addLable()
        
        addImage()
        addButton()
        addSearch()
    }
    func addLable(){
        lbTittle.text = "Home"
        lbTittle.textColor = .black
        lbTittle.font = UIFont.boldSystemFont(ofSize: 25)
        self.addSubview(lbTittle)
        lbTittle.snp.contentHuggingHorizontalPriority = 250
        lbTittle.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-10)
            make.left.equalTo(self).offset(10)
        }
    }
    func addSearch(){
        self.addSubview(search)
        search.placeholder = "Search"
        search.backgroundColor = .white
        search.layer.borderWidth = 0.1
        search.layer.borderColor = UIColor.black.cgColor
        search.layer.cornerRadius = 5
        search.font  = UIFont.systemFont(ofSize: 14)
        search.setLeftPaddingPoints(10)
        search.setRightPaddingPoints(10)
        search.snp.contentHuggingHorizontalPriority = 249
        search.snp.makeConstraints { (make) in
            make.centerY.equalTo(lbTittle)
            make.left.equalTo(lbTittle.snp.right).offset(10)
            make.right.equalTo(image.snp.left).offset(-10)
            make.height.equalTo(40)
            
        }
        let butonRight = UIButton()
        butonRight.setTitle("Tìm kiếm", for: .normal)
        butonRight.frame = CGRect(x: search.frame.width - 50, y: 40, width: 50, height: 40)
        search.rightViewMode = .always
        search.rightView = butonRight
        search.delegate = self
    }
    func addImage(){
        
        image.image = #imageLiteral(resourceName: "icon")
        image.contentMode = .scaleAspectFill
        self.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.height.width.equalTo(50)
            make.bottom.equalTo(self).offset(-10)
            make.right.equalTo(self).offset(-10)
//            make.left.equalTo(lbTittle.snp.right).offset(10)
            
        }
        let gest = UITapGestureRecognizer(target: self, action: #selector(tapAvatar))
        image.addGestureRecognizer(gest)
    }
    func addButton(){
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(image)
            make.bottom.equalTo(image)
            make.left.equalTo(image)
            make.right.equalTo(image)
        }
        button.addTarget(self, action: #selector(tapAvatar), for: .touchUpInside)
    }
 
    @objc func tapAvatar(){
        isPress = !isPress
        action?(isPress)
    }
    override func layoutSubviews() {
        image.layer.cornerRadius =  image.frame.height/2
        image.layer.masksToBounds = true
        search.layer.cornerRadius = search.frame.height/2
        search.layer.masksToBounds = true
        didlayout?()
    }
}
extension NavigationCustom : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        endingSearch?()
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        endingSearch?()
        return true
    }
}
