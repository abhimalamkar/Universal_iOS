//
//  UITableViewExtension.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 1/5/18.
//

import Foundation
import UIKit

public extension UITableViewController {
    
    class func EmptyMessage(message:String, viewController:UITableViewController) {
        let messageLabel = UILabel(frame: CGRect(x:0,y:0,width:viewController.view.bounds.size.width,height: viewController.view.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "Avenir", size: 15)
        messageLabel.sizeToFit()
        
        viewController.tableView.backgroundView = messageLabel;
        viewController.tableView.separatorStyle = .none;
    }
}
