//
//  UIButtonExtension.swift
//  GoogleToolboxForMac
//
//  Created by Abhijeet Malamkar on 12/13/17.
//

import UIKit
import Foundation

public extension UIButton {
    public static func newInstance() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    public static func newInstance(title:String,state:UIControlState,color:String) -> UIButton {
        let button = newInstance()
        button.setTitle(title, for: state)
        button.backgroundColor = UIColor(hexString: color)
        return button
    }
}
