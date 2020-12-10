//
//  MenuSetting.swift
//  DesignEx
//
//  Created by CONG PHAM on 04/12/2020.
//

import Foundation
import UIKit
import SnapKit
class MenuSetting : UIView{
    var height : CGFloat!
    var width : CGFloat!
    let avatar = UIImageView()
    let lbTitle = UILabel()
    var subviewAddDone : (()->Void)?
    var tableview = UITableView()
    let sizeImage = CGSize(width: 80, height: 80)
    var menuDataDelegate = MenuDatasource()
    var tabAvar : (()->Void)?
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    var tableViewHeight: CGFloat {
        tableview.layoutIfNeeded()

        return tableview.contentSize.height
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        
        
    }
    func setup(){
        setupMainView()
        addAvatar()
        addTitle()
        addTableview()
        tableview.delegate = menuDataDelegate
        tableview.dataSource = menuDataDelegate
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.separatorStyle = .none
    }
    func setupMainView(){
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
    }
    func addAvatar(){
        self.addSubview(avatar)
        avatar.contentMode = .scaleAspectFill
        avatar.image = #imageLiteral(resourceName: "icon")
        avatar.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.height.width.equalTo(sizeImage.width)
            make.centerX.equalTo(self.snp.centerX)
            
            
        }
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAvatar))
        avatar.addGestureRecognizer(gesture)
        avatar.isUserInteractionEnabled = true
        
    }
    @objc func tapAvatar(){
        print("tab avatar")
        tabAvar?()
    }
    
    func addTitle(){
        self.addSubview(lbTitle)
        lbTitle.text = "Phạm Công Vũ Hiền"
        lbTitle.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        lbTitle.textColor = .blue
        lbTitle.textAlignment = .center
        lbTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(avatar.snp.bottom).offset(0)
//            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
        }
        
    }
    func addTableview(){
        self.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(lbTitle.snp.bottom).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        height = sizeImage.height
        width = sizeImage.width
        subviewAddDone?()
        avatar.maskCircle(anyImage: avatar.image!)
        
    }
}
class MenuDatasource : NSObject , UITableViewDataSource,UITableViewDelegate{
    var didselect : ((Int)->Void)?
    let listItem = ["Miichisoft","Setting", "Update Profile","General","Message","Logout"]
    var minwidthTableview : CGFloat!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = listItem[indexPath.row]
        cell.selectionStyle = .none
        tableView.snp.updateConstraints { (update) in
            tableView.layoutIfNeeded()
            let height = tableView.contentSize.height
            update.height.equalTo(height)
            tableView.isScrollEnabled = false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didselect?(indexPath.row)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
}
