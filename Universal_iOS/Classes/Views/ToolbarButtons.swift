//
//  ToolbarButtons.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 12/14/17.
//

import UIKit

@available(iOS 9.0, *)
public class ToolbarButtons {
    
    public var buttons:[UIButton]?
    
    public var rightButtonWidthConstraint:NSLayoutConstraint?
    
    public init(view:UIView){
        buttons = [UIButton]()
        
        let leftButton = UIButton.newInstance()
        leftButton.setTitleColor(UIColor.black, for: .normal)
        leftButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
        
        leftButton.setTitle("Back", for: .normal)
        
        view.addSubview(leftButton)
        
        leftButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant:8).isActive = true
        leftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leftButton.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        let rightButton = UIButton.newInstance()
        rightButton.setTitleColor(UIColor(hexString:"#F25452"), for: .normal)
        rightButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
        
        rightButton.setTitle("Next", for: .normal)
        
        view.addSubview(rightButton)
        
        rightButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-8).isActive = true
        rightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightButton.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        rightButtonWidthConstraint = rightButton.widthAnchor.constraint(equalToConstant: 100)
        rightButtonWidthConstraint?.isActive = true
        
        buttons?.append(leftButton)
        buttons?.append(rightButton)
    }
}
