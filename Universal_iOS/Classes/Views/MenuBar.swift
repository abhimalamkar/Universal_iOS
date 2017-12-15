//
//  MenuBar.swift
//  VideoApp
//
//  Created by Abhijeet Malamkar on 2/12/17.
//  Copyright © 2017 abhijeetmalamkar. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
public class MenuBar: UIView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    public var delegate:MenuNavigationDalegate?
    
    public lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(hexString: "#3b3b3b")
       cv.dataSource = self
       cv.delegate = self
       return cv
    }()
    
    let cellId = "cellId"
    public var imageNames:[String] = ["home","image_0","search_icon","account"]
    
    public override init(frame: CGRect){
        super.init(frame: frame)
        
        //homeController?.navigationController?.hidesBarsOnSwipe = true
        addShadow(opacity: 0.3, shadowRadius: 20)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        collectionView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        isBarAdded = true
        
        if isBarAdded! {
            setupHorizontalBar()
        }
        
        (collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? MenuCell)?.imageView.tintColor = .white
    }
    
    public func setupMenuBar(view:UIView) {
        
        //navigationController?.hidesBarsOnSwipe = true
        
        view.addSubview(self)
        let _ = self.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
    }
    
    public var horizontalBarLeftAnchorConstrain: NSLayoutConstraint?
    var isBarAdded:Bool?
    
    func setupHorizontalBar(){
        isBarAdded = true
        let horizontalBarView = UIView()
        horizontalBarView.addShadow(opacity: 0.4, shadowRadius: 10)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        horizontalBarView.backgroundColor = UIColor(white: 0.96, alpha: 1)
        
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstrain = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        
        // need x,y,width,height
        horizontalBarLeftAnchorConstrain?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isBarAdded! {
//            let x = CGFloat(indexPath.item) * frame.width / 4
//            horizontalBarLeftAnchorConstrain?.constant = x
//
//            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                self.layoutIfNeeded()
//            }, completion: nil)
        }
        
        delegate?.goTo(index: indexPath.item)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        //cell.imageView.backgroundColor = .gray
        //cell.tintColor = UIColor.gray
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
@available(iOS 9.0, *)
public class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
         let iv = UIImageView()
         iv.translatesAutoresizingMaskIntoConstraints = false
         //iv.image = UIImage(named: "image")?.withRenderingMode(.alwaysTemplate)
         iv.tintColor = UIColor.lightGray
         return iv
    }()
    
    public override var isHighlighted: Bool{
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.lightGray
        }
    }
    
    public override var isSelected: Bool{
        didSet{
            //change it to tint
            imageView.tintColor = isSelected ? UIColor.white : UIColor.lightGray
        }
    }
   
    public override func setupViews() {
      super.setupViews()
        
        addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: topAnchor,constant:8).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        //backgroundColor = UIColor.lightGray
        //imageView.anchorWithConstantsToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 28, leftConstant: 28, bottomConstant: 28, rightConstant: 28)
    }
}

public class BaseCell: UICollectionViewCell {
    
    public var delegate:NavigationDalegate?
    
    public override init(frame :CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    public func setupViews(){
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public protocol NavigationDalegate {
    
    func hideNavigationBar()
    func showNavigationBar()
}
