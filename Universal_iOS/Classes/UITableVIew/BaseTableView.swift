//
//  BaseTableView.swift
//  Pods-Universal_iOS_Example
//
//  Created by Abhijeet Malamkar on 10/24/17.
//

import Foundation
import UIKit

public class BaseTableViewclass: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    let CELL_HEIGHT:CGFloat = 100
    let CELL_ID = "CELL_1"
    let TABLE_VIEW_TOP_CONSTANT:CGFloat = 0
    let TABLE_VIEW_LEFT_CONSTANT:CGFloat = 0
    let TABLE_VIEW_RIGHT_CONSTANT:CGFloat = 0
    let TABLE_VIEW_BOTTOM_CONSTANT:CGFloat = 0
    
    public override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(TableViewCell.self, forCellReuseIdentifier: CELL_ID)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? TableViewCell
        //cell.textLabel?.text = "10"
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_HEIGHT
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TableViewCell:UITableViewCell {
    
    let view:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black//UIColor(red: 254, green: 251, blue: 245, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(view)
        
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor,constant:0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
