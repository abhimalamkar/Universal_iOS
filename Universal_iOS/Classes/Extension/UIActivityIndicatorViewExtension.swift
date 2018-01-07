//
//  UIActivityIndicatorViewExtension.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 1/5/18.
//

import Foundation
import UIKit

public extension UIActivityIndicatorView {
    
    
    public static  func newInstance(uiView: UIView) -> (activityView:UIActivityIndicatorView,backView:UIView) {
        let container: UIView = UIView()
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor(rgb: 0xffffff, alpha: 0.3)
    
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x:0, y:0, width:80, height:80)
    loadingView.center = uiView.center
    loadingView.backgroundColor = UIColor(rgb: 0x444444, alpha: 0.7)
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10
    
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x:0.0, y:0.0, width:40.0, height:40.0);
    actInd.activityIndicatorViewStyle =
        UIActivityIndicatorViewStyle.whiteLarge
        actInd.center = CGPoint(x:loadingView.frame.size.width / 2,
                                y: loadingView.frame.size.height / 2);
    loadingView.addSubview(actInd)
    container.addSubview(loadingView)
    uiView.addSubview(container)
    actInd.startAnimating()
        
        return (actInd,container)
    }
}
