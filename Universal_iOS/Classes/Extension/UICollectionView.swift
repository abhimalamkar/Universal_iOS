//
//  UICollectionView.swift
//  Pods-Universal_iOS_Example
//
//  Created by Abhijeet Malamkar on 12/13/17.
//

import UIKit

public extension UICollectionView {
    
    public static func newInstance() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }
}
