//
//  User.swift
//  TheApp
//
//  Created by Abhijeet Malamkar on 2/18/17.
//  Copyright © 2017 abhijeetmalamkar. All rights reserved.
//

import UIKit

public class User: NSObject {
    var id:String?
    var name:String?
    var email:String?
    var profile_image_url:String?
    
    public init(id:String,ref:[String:AnyObject]) {
        self.id = id
        self.name = ref["name"] as? String
        self.email = ref["email"] as? String
        self.profile_image_url = ref["profile_image_url"] as? String
    }
    
    public var Name:String {
        return name!
    }
    
    public var Email:String {
        return email!
    }
}
