//
//  HomeDateSource.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/30/20.
//

import Foundation
import UIKit
class HomeViewDatasource : NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var delegate : ((UIViewController, Bool)->Void)?
    var listTopic : [Topic]!{
        var list = [Topic]()
        list.append(Topic(name: "WKWebView", imageUrl: "https://webkit.org/wp-content/uploads/webkit-icon-darkbg.png", baget: 1,sence: WKWebviewMainUIViewController()))
        list.append(Topic(name: "CoreImage", baget: 1))
        list.append(Topic(name: "RXSwift",imageUrl: "https://raw.githubusercontent.com/ReactiveX/RxSwift/main/assets/Rx_Logo_M.png", baget: 0))
        list.append(Topic(name: "Giao diện",imageUrl: "https://icon-library.net/images/layout-icon/layout-icon-3.jpg", baget: 0,sence: LayoutViewController()))
        return list
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTopic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItermCollectionViewCell.init().iditifile, for: indexPath) as! ItermCollectionViewCell
        cell.item = listTopic[indexPath.item]
        cell.shadowDecorate()
        return cell
    }
    override init() {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 40 )/2, height: (UIScreen.main.bounds.width - 40 )/2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let scr : UIViewController = self.listTopic[indexPath.item].sence {
            delegate!(scr,true)
        }else {delegate!(UIViewController(),false)}
        
    }
    
    
}

public class Topic {
    var name : String!
    var imageuUrl : String! = ""
    var barget : Int!
    var sence : UIViewController!
    init() {
        
    }
    init(name : String , imageUrl : String! = nil, baget : Int! = nil, sence : UIViewController! = nil) {
        self.name = name
        self.imageuUrl = imageUrl ?? ""
        self.barget =  baget
        self.sence = sence
    }
}

