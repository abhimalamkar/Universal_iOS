//
//  StringExtension.swift
//  Pods-Universal_iOS_Example
//
//  Created by Abhijeet Malamkar on 10/25/17.
//

import Foundation
import WebKit

public extension String {
    
   public func grabData() -> String {
        var text = ""
        guard let myURL = URL(string: self) else {
            print("Error: \(self) doesn't seem to be a valid URL")
            return ""
        }
        
        do {
            text = try String(contentsOf: myURL, encoding: .ascii)
        }
            
        catch let error {
            print("Error: \(error)")
        }
        
        return text
    }
    
    public func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGRect {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return boundingBox
    }
    
    public func callNumber() {
        if isPhoneNumber {
        if let phoneCallURL = URL(string: "tel://\(self)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
      }
    }
    

    public static func estimatedFrameForText(text:String,fontSize:CGFloat) -> CGRect {
        let size = CGSize(width: 1000, height: 10000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: fontSize)], context: nil)
    }
    
    public func openUrl() {
        if let url = NSURL(string:self) {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    //To check text field or String is blank or not
    public var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //Validate Email
    
   public var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    public var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    public var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    public func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    public func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    //validate Password
    public var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil){
                
                if(self.count>=6 && self.count<=20){
                    return true
                } else{
                    return false
                }
            } else{
                return false
            }
        } catch {
            return false
        }
    }
    
    public func getDate(inFormat:String,toFormat:String) -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = inFormat
        dateFormatterGet.timeZone = NSTimeZone.default
        let date: Date? = dateFormatterGet.date(from: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = toFormat

        if date == nil {
            return "Wrong format/Wrong Date"
        }
        
        return dateFormatter.string(from: date!)
    }
    
    public var isNumber: Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
    
}

public extension NSLayoutConstraint {
    public func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}
