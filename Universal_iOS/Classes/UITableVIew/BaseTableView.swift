//
//  BaseTableView.swift
//  Pods-Universal_iOS_Example
//
//  Created by Abhijeet Malamkar on 10/24/17.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
public class BaseTableViewclass: UITableView {
    
    public var CELL_HEIGHT:CGFloat = 100
    public var CELL_COUNT = 0
    public var SECTION_COUNT = 0
    public let CELL_ID = "CELL_1"

    
    public override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    public func registerCell(cellClass:AnyClass) {
        self.register(cellClass, forCellReuseIdentifier: CELL_ID)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
