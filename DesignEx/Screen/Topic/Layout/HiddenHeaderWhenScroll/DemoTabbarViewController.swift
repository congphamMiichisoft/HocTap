//
//  DemoTabbarViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 04/12/2020.
//

import UIKit
import SnapKit
class DemoTabbarViewController: UITabBarController {
    let vc1 = UINavigationController(rootViewController: DemoViewController1())
    let vc2 = UINavigationController(rootViewController: DemoViewController2())
    let vc3 = UINavigationController(rootViewController: DemoViewController3())
    let vc4 = UINavigationController(rootViewController: DemoViewController4())
    let vc5 = UINavigationController(rootViewController: DemoViewController5())
    var naviView : NavigationCustom!
    var viewM = UIView()
    let listname = ["Trang chủ","Yêu thích","Tìm kiếm"]
    var menu : MenuSetting!
    var imageViewAvatar : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vc1.view.backgroundColor = .white
        vc2.view.backgroundColor = .white
        vc3.view.backgroundColor = .white
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 2)
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        vc4.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 4)
        vc5.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 5)
        self.viewControllers = [vc1,vc2,vc3,vc4,vc5]
//        addHeader()
//     addMenu()
        self.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
        
    }
  
    
    func zoomAvatar(){
        imageViewAvatar = UIImageView()
        self.view.addSubview(imageViewAvatar)
        imageViewAvatar.image = #imageLiteral(resourceName: "icon")
        imageViewAvatar.contentMode = .scaleAspectFill
        imageViewAvatar.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(UIScreen.main.bounds.width - 10)
        }
        imageViewAvatar.layer.cornerRadius = 5
        imageViewAvatar.layer.shadowColor = UIColor.black.cgColor
        imageViewAvatar.layer.shadowOpacity = 1
        imageViewAvatar.layer.shadowOffset = .zero
        imageViewAvatar.layer.shadowRadius = 50
    }
    
    func addView(){
        let viewTest = UIView()
        self.view.addSubview(viewTest)
        viewTest.backgroundColor = .green
        viewTest.snp.makeConstraints { (make) in
            let window = UIApplication.shared.windows[0]
            let top = window.safeAreaInsets.top
            make.top.equalTo(self.view).offset(top)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.height.equalTo(100)
        }
    }

    
    func addHeader(){
        let window = UIApplication.shared.windows[0]
        let top = window.safeAreaInsets.top
        naviView = NavigationCustom()
        self.view.addSubview(naviView)
        naviView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(0)
            make.height.equalTo(100)
        }
        naviView.action = { [weak self] isPress in
            self?.menu.isHidden = isPress == true ? true : false
        }
        naviView.endingSearch = {
            print("searching")
        }
        naviView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
    func addMenu(){
        menu = MenuSetting()
        view.addSubview(menu)
        menu.isHidden = true
        menu.snp.makeConstraints { [weak self](make) in
            make.top.equalTo(naviView.snp.bottom).offset(10)
            make.right.equalTo(self!.view).offset(-10)
        }
        menu.tabAvar = {
            self.zoomAvatar()
        }
        menu.menuDataDelegate.didselect = {index in
            print("select \(index)")
             self.touchesBegan(.init(), with: .init())
        }
    }
   
}
class DemoViewController1 : DemoBaseViewController , UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        let title = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        title.text = "Favorites"
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        headerView.addSubview(title)
        headerView.backgroundColor = .white
        return headerView
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabableview.dequeueReusableCell(withIdentifier: "FavoriteCallUITableviewCell", for: indexPath) as! FavoriteCallUITableviewCell
//        cell.lableTitle.text = "Em Yêu"
        cell.selectionStyle = .none
        return cell
    }
    
    var tabableview = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFavorite))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editFavorite))
        tabableview.delegate = self
        tabableview.dataSource = self
        tabableview.register(FavoriteCallUITableviewCell.self, forCellReuseIdentifier: "FavoriteCallUITableviewCell")
        tabableview.separatorStyle = .none
        addtableview()
    
    }
    @objc func addFavorite(){
        
    }
    @objc func editFavorite(){
        
    }
    func addtableview (){
        self.view.addSubview(tabableview)
        tabableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(10)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.bottom.equalTo(self.view).offset(-10)
        }
    }
    
}
class DemoViewController2 : DemoBaseViewController , UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        let title = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        title.text = "Recentes"
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        headerView.addSubview(title)
        headerView.backgroundColor = .white
        return headerView
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabableview.dequeueReusableCell(withIdentifier: "RecentsAllCallUITableviewCell", for: indexPath) as! RecentsAllCallUITableviewCell
//        cell.lableTitle.text = "Em Yêu"
        cell.selectionStyle = .none
        return cell
    }
    
    var tabableview = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabableview.delegate = self
        tabableview.dataSource = self
        tabableview.register(RecentsAllCallUITableviewCell.self, forCellReuseIdentifier: "RecentsAllCallUITableviewCell")
        tabableview.separatorStyle = .none
        addtableview()
        let segment: UISegmentedControl = UISegmentedControl(items: ["All", "Missed"])
            segment.sizeToFit()
            if #available(iOS 13.0, *) {
                segment.selectedSegmentTintColor = UIColor.white
            } else {
               segment.tintColor = UIColor.white
            }
            segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], for: .normal)
            self.navigationItem.titleView = segment
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editRecents))
    
    }
    @objc func editRecents(){
        
    }
    func addtableview (){
        self.view.addSubview(tabableview)
        tabableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(10)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.bottom.equalTo(self.view).offset(-10)
        }
    }
    
}
class DemoViewController3 : DemoBaseViewController , UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        let title = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        title.text = "Contacts"
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        headerView.addSubview(title)
        headerView.backgroundColor = .white
        return headerView
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabableview.dequeueReusableCell(withIdentifier: "FavoriteCallUITableviewCell", for: indexPath) as! FavoriteCallUITableviewCell
//        cell.lableTitle.text = "Em Yêu"
        cell.selectionStyle = .none
        return cell
    }
    
    var tabableview = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabableview.delegate = self
        tabableview.dataSource = self
        tabableview.register(FavoriteCallUITableviewCell.self, forCellReuseIdentifier: "FavoriteCallUITableviewCell")
        tabableview.separatorStyle = .none
        addtableview()
    
    }
    func addtableview (){
        self.view.addSubview(tabableview)
        tabableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(10)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.bottom.equalTo(self.view).offset(-10)
        }
    }
    
}
class DemoViewController4 : DemoBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
class DemoViewController5 : DemoBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
class DemoBaseViewController : UIViewController {
    var swipe : UISwipeGestureRecognizer!
    var tabbarMain : DemoTabbarViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabbar : DemoTabbarViewController? = tabBarController as! DemoTabbarViewController {
            self.tabbarMain = tabbar
        }
        swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        self.view.addGestureRecognizer(swipe)
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidLayoutSubviews() {
//        constraintMainView()
    }
    func constraintMainView(){
        let heightHeader = tabbarMain.naviView.frame.height
        let heightTabbar = tabBarController?.tabBar.frame.size.height ?? 49
        self.view.frame = CGRect(x: 0, y: heightHeader, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - heightHeader - heightTabbar )
        self.loadViewIfNeeded()
    }
    
    @objc func swipeAction(){
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
}
extension DemoTabbarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        self.touchesBegan(.init(), with: .init())
      return true
    }
}
class FavoriteCallUITableviewCell : UITableViewCell {
    var img = UIImageView()
    var lableTitle = UILabel()
    var iconPhone = UIImageView()
    var lbType = UILabel()
    var btnInfo = UIButton()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setup(){
        addAvartar()
        addTitle()
        addButtonInfo()
    }
    func addAvartar(){
        img.image = #imageLiteral(resourceName: "icon")
        img.contentMode = .scaleAspectFill
        self.addSubview(img)
        img.snp.makeConstraints { (make) in
            make.height.width.equalTo(40)
            make.left.equalTo(self).offset(10)
            make.centerY.equalTo(self)
            make.top.greaterThanOrEqualToSuperview().offset(10)
            make.bottom.greaterThanOrEqualToSuperview().offset(10)
        }
    }
    func addTitle(){
        let stackview = UIStackView()
        stackview.axis = .vertical
        self.addSubview(stackview)
        stackview.spacing = 5
        lableTitle.text = "Em Yêu"
        lableTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        stackview.addArrangedSubview(lableTitle)
        stackview.snp.makeConstraints { (make) in
            make.centerY.equalTo(img)
            make.left.equalTo(img.snp.right).offset(10)
            make.right.equalTo(self).offset(-10)
        }
        let stackview2 = UIStackView()
        stackview2.axis = .horizontal
        lbType.text = "Di Động"
        lbType.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        iconPhone.image = #imageLiteral(resourceName: "iconphone")
        iconPhone.contentMode = .scaleAspectFill
        iconPhone.snp.makeConstraints { (make) in
            make.height.width.equalTo(15)
        }
        stackview2.spacing = 5
        stackview2.addArrangedSubview(iconPhone)
        stackview2.addArrangedSubview(lbType)
        stackview.addArrangedSubview(stackview2)
        let viewLine = UIView()
        viewLine.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.leading.equalTo(stackview.snp.leading)
            make.trailing.equalTo(stackview.snp.trailing)
            make.bottom.equalTo(self)
        }
    }
    func addButtonInfo(){
        self.addSubview(btnInfo)
        btnInfo.snp.makeConstraints { (make) in
            make.height.width.equalTo(20)
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
        }
       
        if #available(iOS 13.0, *) {
            let image = #imageLiteral(resourceName: "infoicon").withRenderingMode(.alwaysTemplate)
            image.withTintColor(.blue)
            btnInfo.setImage(image, for: .normal)
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    override func layoutSubviews() {
        img.layer.cornerRadius = img.layer.frame.height/2
        img.clipsToBounds = true
    }
}
class RecentsAllCallUITableviewCell : UITableViewCell {
    var img = UIImageView()
    var lableTitle = UILabel()
    var iconPhone = UIImageView()
    var lbType = UILabel()
    var btnInfo = UIButton()
    var lbTime = UILabel()
    var stackview1 = UIStackView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setup(){
        addicontypeCall()
        addTitle()
        
        addButtonInfo()
    }
    func addicontypeCall(){
        img.image = #imageLiteral(resourceName: "iconphone")
        img.contentMode = .scaleAspectFill
        self.addSubview(img)
        img.snp.makeConstraints { (make) in
            make.height.width.equalTo(14)
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(5)
        }
    }
    func addTitle(){
         stackview1 = UIStackView()
        stackview1.axis = .vertical
        self.addSubview(stackview1)
        stackview1.spacing = 5
        lableTitle.text = "Em Yêu"
        if Bool.random() {
            lableTitle.textColor = .red
        }else {
            lableTitle.textColor = .black
        }
        lableTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        stackview1.addArrangedSubview(lableTitle)
        stackview1.snp.makeConstraints { (make) in
//            make.centerY.equalTo(self)
            make.left.equalTo(img.snp.right).offset(10)
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
        }
        let stackview2 = UIStackView()
        stackview2.axis = .horizontal
        lbType.text = "Di Động"
        lbType.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        iconPhone.image = #imageLiteral(resourceName: "iconphone")
        iconPhone.contentMode = .scaleAspectFill
        iconPhone.snp.makeConstraints { (make) in
            make.height.width.equalTo(15)
        }
        stackview2.spacing = 5
        stackview2.addArrangedSubview(lbType)
        stackview1.addArrangedSubview(stackview2)
        let viewLine = UIView()
        viewLine.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.leading.equalTo(stackview1.snp.leading)
            make.trailing.equalTo(stackview1.snp.trailing)
            make.bottom.equalTo(self)
        }
    }
    func addButtonInfo(){
        self.addSubview(btnInfo)
        btnInfo.snp.makeConstraints { (make) in
            make.height.width.equalTo(20)
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
        }
       
        if #available(iOS 13.0, *) {
            let image = #imageLiteral(resourceName: "infoicon").withRenderingMode(.alwaysTemplate)
            image.withTintColor(.blue)
            btnInfo.setImage(image, for: .normal)
        } else {
            // Fallback on earlier versions
        }
        self.addSubview(lbTime)
        lbTime.text = "21:50"
        lbTime.font = UIFont.systemFont(ofSize: 12)
        lbTime.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        lbTime.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnInfo)
            make.right.equalTo(btnInfo.snp.left).offset(-5)
//            make.left.equalTo(stackview1.snp.right).offset(5)
        }
        
    }
    override func layoutSubviews() {
        img.layer.cornerRadius = img.layer.frame.height/2
        img.clipsToBounds = true
    }
}
