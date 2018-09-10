//
//  UIImageViewExtension.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 12/15/17.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()
let Queue = DispatchQueue(label: "Image")

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
                        self.image = image
                    }
                }
            }
            
            task.resume()
        }
    }
    
    public static func addImageToCache(urlString:String){
        if urlString.isEmpty {
            return
        }
        
        //check cache array first
        if imageCache.object(forKey: urlString as NSString) != nil {
            return
        }
        
        DispatchQueue.main.async {
            if let url = URL(string: urlString){
                let data = try? Data(contentsOf: url)
                // check if we should use dispatch or not
                
                if let image = UIImage(data: data!){
                    imageCache.setObject(image, forKey: urlString as NSString)
                }
            }
        }
    }
    
    typealias imageCompletionHandler = (_ transfers:UIImage?) -> Void
    public static func getImageFromLink(urlString:String,completion:@escaping imageCompletionHandler){
        
        if urlString.isEmpty {
            return
        }
        
        //check cache array first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            completion(cachedImage as? UIImage)
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
                        completion(image)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    public static func getImageFromLink(urlString:String) -> UIImage?{
        
        if urlString.isEmpty {
            return nil
        }
        
        //check cache array first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            return cachedImage as? UIImage
        }
        
        return nil
    }
    
    public func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width:size.width * heightRatio, height:size.height * heightRatio)
        } else {
            newSize = CGSize(width:size.width * widthRatio,  height:size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x:0, y:0, width:newSize.width, height:newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
