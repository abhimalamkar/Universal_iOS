//
//  TableViewCell.swift
//  Pods-Universal_iOS_Example
//
//  Created by Abhijeet Malamkar on 10/25/17.
//

import UIKit

@available(iOS 9.0, *)
public class TableViewCell:UITableViewCell {
    
    public let MARGIN:CGFloat = 16
    
    public let view:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black//UIColor(red: 254, green: 251, blue: 245, alpha: 1)
        return view
    }()
    
    public let titleText:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.textAlignment = .center
        return view
    }()
    
    public let subTitleText:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.textAlignment = .center
        return view
    }()
    
    public let summery:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.textAlignment = .center
        return view
    }()
    
    public let cost:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .right
        return view
    }()
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(view)
        
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor,constant:3).isActive = true
        
        addSubview(titleText)
        
        titleText.topAnchor.constraint(equalTo: view.topAnchor,constant:MARGIN).isActive = true
        titleText.leftAnchor.constraint(equalTo: view.leftAnchor,constant:MARGIN).isActive = true
        titleText.heightAnchor.constraint(equalToConstant: 24).isActive = true
        titleText.widthAnchor.constraint(equalTo: view.widthAnchor,constant:MARGIN*2).isActive = true
        
        addSubview(cost)
        
        cost.topAnchor.constraint(equalTo: view.topAnchor,constant:MARGIN).isActive = true
        cost.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-MARGIN).isActive = true
        cost.heightAnchor.constraint(equalToConstant: 24).isActive = true
        cost.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(subTitleText)
        
        subTitleText.topAnchor.constraint(equalTo: titleText.bottomAnchor,constant:4).isActive = true
        subTitleText.leftAnchor.constraint(equalTo: view.leftAnchor,constant:MARGIN).isActive = true
        subTitleText.heightAnchor.constraint(equalToConstant: 24).isActive = true
        subTitleText.widthAnchor.constraint(equalTo: view.widthAnchor,constant:MARGIN*2).isActive = true
        
        addSubview(summery)
        
        summery.topAnchor.constraint(equalTo: subTitleText.bottomAnchor,constant:4).isActive = true
        summery.leftAnchor.constraint(equalTo: view.leftAnchor,constant:MARGIN).isActive = true
        summery.heightAnchor.constraint(equalToConstant: 24).isActive = true
        summery.widthAnchor.constraint(equalTo: view.widthAnchor,constant:MARGIN*2).isActive = true
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
