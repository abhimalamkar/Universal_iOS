//
//  UIViewControllerExtension.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 1/9/18.
//

import Foundation

public extension UIViewController {
    
   public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
