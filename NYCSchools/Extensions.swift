//  Extensions.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
// ----------------------------------------------------------------------------------

import UIKit

extension UIColor {
    class var skyBlue: UIColor {
        return UIColor(red: 217 / 255, green: 234 / 255, blue: 239 / 255, alpha: 1.0)
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?,
                centerYAnchor: NSLayoutYAxisAnchor?, centerXAnchor: NSLayoutXAxisAnchor?,
                paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat,
                paddingRight: CGFloat, width: CGFloat, height: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false

        if let centerXAnchor = centerXAnchor {
            self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        }
        if let centerYAnchor = centerYAnchor {
            self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        }
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension NSAttributedString {
    class func palatino(inputString: String) -> NSAttributedString {
        let fnt = UIFont(name: "Palatino", size: 18.0)
        let attributedString = NSMutableAttributedString(string: inputString, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): fnt!]))
        return attributedString
    }

    class func palatinoWithSizeAndColor(inputString: String, size: CGFloat, color: UIColor) -> NSAttributedString {
        let font = UIFont(name: "Palatino", size: size)
        let attributedString = NSMutableAttributedString(string: inputString, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): font!, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): color]))
        return attributedString
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value) })
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}
