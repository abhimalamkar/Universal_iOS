//
//  UIAlertControllerExtension.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 1/5/18.
//

import Foundation

public extension UIAlertController {
    public func newInstance() {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            }}))
    }
}
