//
//  UIlabel+Extensions.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func setPrice(price: Int) {
        
        let actualPrice = price
        
        let formatter = Formatters()
        var priceString: String = ""
        
        if LocalizationManager.currentLanguage().languageCode == Language.english.rawValue {
            
            if actualPrice <= 99999 && actualPrice > 0 {
                priceString = "\(actualPrice)"
            } else if actualPrice > 99999 && actualPrice <= 999_999 {
                let priceK: Int = actualPrice / 1000
                priceString = "\(priceK) K"
            } else {
                priceString = "--"
            }
        } else {
            
            if actualPrice <= 99999 && actualPrice > 0 {
                priceString = formatter.localizeNumber(toArabic: actualPrice )
            } else if actualPrice > 99999 && actualPrice <= 999_999 {
                let priceK: Int = actualPrice / 1000
                priceString = formatter.localizeNumber(toArabic: priceK) + "الف"
            } else {
                priceString = "--"
            }
        }
        
        self.text = priceString
    }
}

extension UILabel {
    func setUnderLinedText(text: String) {
        let attributes = [
            NSAttributedString.Key.underlineStyle : 1]

        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        self.attributedText = attributedString
    }
}

extension UILabel {

}
