//
//  UIScrollViewExtension.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 8/8/18.
//

import UIKit

public extension UIScrollView {
    public func reload(){
        var contentRect = CGRect.zero
        
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        self.contentSize = CGSize(width: UIScreen.main.bounds.width, height: contentRect.size.height)
    }
}
