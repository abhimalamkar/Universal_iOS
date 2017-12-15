//
//  ButtonList.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 12/13/17.
//

import UIKit

@available(iOS 9.0, *)
public class ButtonList {

    public var buttons:[UIButton]?
    
    public typealias CompletionHandler = (_ button:UIButton) -> UIButton
    public init(view:UIView,buttonCount:Int,margin:CGFloat,sideMargine:CGFloat,completionHandler: CompletionHandler) {
        buttons = [UIButton]()
        
        let buttonHeight = ((view.frame.height - (CGFloat(buttonCount) * margin) - (2*margin)) / CGFloat(buttonCount))
        let firstGap:CGFloat = (view.frame.height - (CGFloat(buttonCount) * (buttonHeight+margin)) + margin) / 2
        
        
        for i in 0...buttonCount-1 {
            let button = UIButton.newInstance()
            
            view.addSubview(button)
            button.tag = i
            button.backgroundColor = .gray
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: (i == 0 ? firstGap : firstGap + CGFloat(i) * (buttonHeight+margin))).isActive = true
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: sideMargine).isActive = true
            button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            button.widthAnchor.constraint(equalToConstant: view.frame.width - (sideMargine*2)).isActive = true
            
            
            buttons?.append(completionHandler(button))
        }
    }
}
