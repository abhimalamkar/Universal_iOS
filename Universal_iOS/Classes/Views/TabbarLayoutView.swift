//
//  Tabbar.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 7/9/18.
//

import UIKit

@available(iOS 9.0, *)
public class TabbarLayoutView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    public var ITEMS:[String] = [] {
        didSet{
            DispatchQueue.main.async {
                self.layoutIfNeeded()
                
//                var size:CGFloat = 0.0
//                
//                for item in self.ITEMS {
//                    size = size + String.estimatedFrameForText(text: item, fontSize: self.FONT_SIZE).width
//                }
//                
//                var frameWidth = self.frame.width
//                
//                
//                
//                size = (self.frame.width - size) / 2
//                
//                print(size)
//                
//                self.collectionView.contentInset = UIEdgeInsets(top: 0, left: size, bottom: 0, right: size)
                
                self.collectionView.reloadData()
            }
        }
    }
    public var FONT_SIZE:CGFloat = 16
    public var CLASSES = [AnyClass]()
    public var delegate:ScrollToIndex?
    
    public lazy var collectionView: UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.backgroundColor = UIColor(hexString: "#212121")
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.dataSource = self
        return cv
    }()
    
    var CELL_ID = "CELL_ID"
    var SELECTED_INDEX = 0
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        registerCell()
        
    }
    
    public func setSelected(index:Int) {
        SELECTED_INDEX = index
        collectionView.reloadData()
        //collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: true)
    }
    
    func registerCell(){
        addSubview(collectionView)
        
        collectionView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        collectionView.register(TabCell.self, forCellWithReuseIdentifier: CELL_ID)
        
        
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ITEMS.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as? TabCell
        cell?.backgroundColor = UIColor(hexString: "#212121")
        cell?.textView.text = ITEMS[indexPath.row]
        cell?.textView.font = UIFont.systemFont(ofSize: FONT_SIZE)
        cell?.isSelected(isSelected: indexPath.row == SELECTED_INDEX, FONT_SIZE: FONT_SIZE)
        
        return cell!
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = String.estimatedFrameForText(text: ITEMS[indexPath.row], fontSize: FONT_SIZE)
        return CGSize(width: size.width + 32, height: frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollTo(index: indexPath.row)
        setSelected(index: indexPath.row)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public class TabCell:UICollectionViewCell {
        
        func isSelected(isSelected:Bool,FONT_SIZE:CGFloat){
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.textView.font = isSelected ? UIFont.boldSystemFont(ofSize: FONT_SIZE) : UIFont.systemFont(ofSize: FONT_SIZE)
                self.textView.textColor = isSelected ? .white : .lightGray
                
                self.layoutIfNeeded()
            }, completion: nil)
        }
        
        let textView:UILabel = {
            let view = UILabel()
            view.textColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            view.textAlignment = .center
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        func setupViews(){
            addSubview(textView)
            
            textView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        }
        
        required public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

public protocol ScrollToIndex{
    func scrollTo(index:Int)
}
