//
//  HomeViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/30/20.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionview: UICollectionView!
    var listTopic = [Topic]()
    var homedatasource = HomeViewDatasource()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionview.delegate = homedatasource
        self.collectionview.dataSource = homedatasource
        self.homedatasource.delegate = {item,result in
            if result {
                self.navigationController?.pushViewController(item, animated: true)
            }else {
                let alert = UIAlertController.initAlert(title: "Thông báo", mess: "Chưa có chức năng nào trong mục này") {
                    
                } actionCancel: {
                    
                }
                self.present(alert, animated: true, completion: nil)

            }
        }
        self.collectionview.register(UINib(nibName: ItermCollectionViewCell.init().iditifile, bundle: nil), forCellWithReuseIdentifier: ItermCollectionViewCell.init().iditifile)
        self.hideKeyboardWhenTappedAround()
        self.configSearch()
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
   
    

}

