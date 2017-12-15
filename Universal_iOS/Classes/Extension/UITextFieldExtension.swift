//
//  UITextFieldExtension.swift
//  Pods-Universal_iOS_Example
//
//  Created by Abhijeet Malamkar on 10/25/17.
//

@available(iOS 9.0, *)
public extension UITextField {
    
    @IBInspectable var placeholderColor: UIColor {
        get {
            guard let currentAttributedPlaceholderColor = attributedPlaceholder?.attribute(NSAttributedStringKey.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { return UIColor.clear }
            return currentAttributedPlaceholderColor
        }
        set {
            guard let currentAttributedString = attributedPlaceholder else { return }
            let attributes = [NSAttributedStringKey.foregroundColor : newValue]
            
            attributedPlaceholder = NSAttributedString(string: currentAttributedString.string, attributes: attributes)
        }
    }
    
    public typealias CompletionHandler = (_ label:UILabel) -> Void
    public func addRighLabelWithText(text:String,fontSize:CGFloat,complitionBlock:CompletionHandler?) {
        
        let frame:CGRect = String.estimatedFrameForText(text: text, fontSize: fontSize)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        label.text = text
        label.textColor = UIColor(hexString: "#827C7C")
        label.textAlignment = .center
        
        
        self.rightView = label
        rightViewMode = .always
        
        if complitionBlock != nil {
        complitionBlock!(label)
        }
    }
    
    public static func newInstance() -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }
    
    
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
//        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
//        animation.fromValue = baseColor
//        animation.toValue = UIColor.red.cgColor
//        animation.duration = 0.4
//        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
//        self.layer.add(animation, forKey: "shadowColor")
        let color = self.textColor
        self.textColor = .red
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 0.21, repeats: false) { (time) in
                self.textColor = color
            }
        } else {
            // Fallback on earlier versions
        }
        
        shake(numberOfShakes: shakes, revert: revert)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
