//
//  Toolbar.swift
//  GoogleToolboxForMac
//
//  Created by Abhijeet Malamkar on 12/13/17.
//

import UIKit

@available(iOS 9.0, *)
public class Toolbar {
   
    public var bottomAnchor:NSLayoutConstraint?
    
    public var toolbarView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addShadow(opacity: 0.2, shadowRadius: 20)
        view.backgroundColor = .white
        return view
    }()
    
    public init(view:UIView) {
        view.addSubview(toolbarView)
        
        bottomAnchor = toolbarView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        bottomAnchor?.isActive = true
        toolbarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        toolbarView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        toolbarView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
}
