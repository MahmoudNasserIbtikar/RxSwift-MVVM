//
//  UIView+Extensions.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import  UIKit

extension UIView {
    func showView(){
        self.isHidden = false
        if self.isHidden == true {
            self.showView()
        }
    }
    
    func hideView(){
        self.isHidden = true
        if self.isHidden == false {
            self.hideView()
        }
    }
}

extension UICollectionReusableView {
    class var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    class var identifier: String {
        return String(describing: self)
    }
}

extension UIView {
    func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = [
            UIColor.antiqueFuchsia.cgColor,
            UIColor.orange.cgColor
        ]
        layer.insertSublayer(gradient, at: 0)
    }
}

extension UIView {
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor, viewWidth: CGFloat, viewHeight: CGFloat, cornerRadius: CGFloat) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 0.7]
        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.frame = CGRect(x: bounds.minX, y: bounds.minY, width: viewWidth, height: viewHeight)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setViewCornerRadius() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.platinum.cgColor
        
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.2
    }
    func setShadow(
        shadowRadius: CGFloat,
        xOffset: Int,
        yOffset: Int,
        color: UIColor,
        opacity: Float,
        cornerRadius: CGFloat = CGFloat(0), masksToBounds: Bool) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: xOffset, height: yOffset)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = masksToBounds
    }
    
    func setShadowBorder(
        shadowRadius: CGFloat,
        xOffset: Int,
        yOffset: Int,
        color: UIColor,
        opacity: Float,
        cornerRadius: CGFloat = CGFloat(0), masksToBounds: Bool, borderColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: xOffset, height: yOffset)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = masksToBounds
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
    }
}

extension UIViewController {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    func openActivityViewController(title: String? = nil,
                                    urlString: String? = nil,
                                    image: UIImage? = nil) {
        var activityItems = [Any]()
        if let title = title {
            activityItems.append(title)
        }
  
        if let url = urlString?.url {
            activityItems.append(url)
        }
        if let image = image {
            activityItems.append(image)
        }
        openActivityViewController(activityItems: activityItems)
    }
    
    func openActivityViewController(activityItems: [Any]) {
        let activityViewController = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIButton {
    func setCornerRadius() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UIDevice {
    var iPhoneX: Bool { UIScreen.main.nativeBounds.height == 2436 }
    var iPhone: Bool { UIDevice.current.userInterfaceIdiom == .phone }
    var iPad: Bool { UIDevice().userInterfaceIdiom == .pad }
    enum ScreenType: String {
        case iPhones_4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhones_X_XS = "iPhone X or iPhone XS"
        case iPhone_XR_11 = "iPhone XR or iPhone 11"
        case iPhone_XSMax_ProMax = "iPhone XS Max or iPhone Pro Max"
        case iPhone_11Pro = "iPhone 11 Pro"
        case unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR_11
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2426:
            return .iPhone_11Pro
        case 2436:
            return .iPhones_X_XS
        case 2688:
            return .iPhone_XSMax_ProMax
        default:
            return .unknown
        }
    }
    
}

// MARK: - Intiating Nib View
extension Bundle {

    static func loadView<T:UIView>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }

        fatalError("Could not load view with type " + String(describing: type))
    }
}

protocol NibInstantiatable {
    static var nibName: String { get }
}

extension NibInstantiatable {

    static var nibName: String { return String(describing: self)}

    static func instantiateFromNib() -> Self {
        return instantiateWithName(name: nibName)
    }

    static func instantiateWithOwner(owner: AnyObject?) -> Self {
        return instantiateWithName(name: nibName, owner: owner)
    }

    static func instantiateWithName(name: String, owner: AnyObject? = nil) -> Self {
        let nib = UINib(nibName: name, bundle: nil)
        guard let view = nib.instantiate(withOwner: owner, options: nil).first as? Self else {
            fatalError("failed to load \(name) nib file")
        }
        return view
    }
}

extension UIView: NibInstantiatable {}


extension UIView {
    func createDottedLine(width: CGFloat, thickness: CGFloat, color: UIColor) {
      let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = color.cgColor
      caShapeLayer.lineWidth = thickness
      caShapeLayer.lineDashPattern = [3,2]
      let cgPath = CGMutablePath()
    let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: width, y: 0)]
      cgPath.addLines(between: cgPoint)
      caShapeLayer.path = cgPath
    self.layer.addSublayer(caShapeLayer)
   }
}
