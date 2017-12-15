//
//  BaseCollectionViewCell.swift
//  Pods-Universal_iOS_Example
//
//  Created by Abhijeet Malamkar on 10/25/17.
//

import UIKit

open class BaseCollectionViewCell: UICollectionViewCell {
    
    private let highlightedColor = UIColor(hexString: "#F25452")
    
    public override init(frame:CGRect){
        super.init(frame:frame)
        
        setupViews()
    }
    
    open func setupViews(){
    }
    
    public var shouldTintBackgroundWhenSelected = true // You can change default value
    public var specialHighlightedArea: UIView?
    
    open override var isHighlighted: Bool { // make lightgray background show immediately(使灰背景立即出现)
        willSet {
            onSelected(newValue)
        }
    }
    open override var isSelected: Bool { // keep lightGray background until unselected (保留灰背景)
        willSet {
            onSelected(newValue)
        }
    }
    
    public func onSelected(_ newValue: Bool) {
        guard selectedBackgroundView == nil else { return }
        if shouldTintBackgroundWhenSelected {
            contentView.backgroundColor = newValue ? highlightedColor : UIColor.clear
        }
        if let sa = specialHighlightedArea {
            sa.backgroundColor = newValue ? UIColor.black.withAlphaComponent(0.4) : UIColor.clear
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
