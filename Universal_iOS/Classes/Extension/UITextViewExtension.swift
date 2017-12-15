//
//  UITextViewExtension.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 12/13/17.
//

import UIKit

public extension UITextView {
    public static func newInstance() -> UITextView{
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
