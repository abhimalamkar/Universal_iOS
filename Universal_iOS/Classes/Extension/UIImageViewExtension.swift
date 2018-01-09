//
//  UIImageViewExtension.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 12/15/17.
//

import Foundation

let imageCache = NSCache<NSString, AnyObject>()

public extension UIImageView {
    
    public func loadImageUsingCacheUrlString(urlString:String){
        if urlString.isEmpty {
            self.image = nil
            return
        }
        image = nil
        
        //check cache array first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage as? UIImage
            return
        }
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            
            DispatchQueue.main.async {
                
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = UIImage(data: data!)
                }
            }
        }
        
        task.resume()
        }
    }
    
}
