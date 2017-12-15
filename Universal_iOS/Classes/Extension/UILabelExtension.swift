//
//  UILabelExtension.swift
//  GoogleToolboxForMac
//
//  Created by Abhijeet Malamkar on 12/14/17.
//

import UIKit

public extension UILabel {
    
    public static func newInstance() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    
    
}
