//
//  UIFont+Extensions.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import UIKit

enum FontWeight {
    case regular
    case bold
    case Light
    case Medium
    case SemiBold
}

extension UIFont {
    
    class func appFont(ofSize: CGFloat, weight: FontWeight) -> UIFont {
        if LocalizationManager.currentLanguage().languageCode == Language.english.rawValue {
            switch weight {
//            case .regular:
//                return UIFont(name: "Poppins-Regular", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
//            case .bold:
//                return UIFont(name: "Poppins", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
//            case .Light:
//                return UIFont(name: "Poppins-Light", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
//            case .Medium:
//                return UIFont(name: "Poppins-Medium", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
//            case .SemiBold:
//                return UIFont(name: "Poppins-SemiBold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
//            }
                
                case .regular:
                    return UIFont(name: "HelveticaNeue", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
                case .bold:
                    return UIFont(name: "HelveticaNeue-Bold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
                case .Light:
                    return UIFont(name: "HelveticaNeue-Light", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
                case .Medium:
                    return UIFont(name: "HelveticaNeue-Medium", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
                case .SemiBold:
                    return UIFont(name: "HelveticaNeue-Bold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
                }
        } else {
            switch weight {
            case .regular:
                return UIFont(name: "GESSTextLight-Light", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
            case .bold:
                return UIFont(name: "GESSTextBold-Bold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
            case .Light:
                return UIFont(name: "GESSTextLight-Light", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
            case .Medium:
                return UIFont(name: "GESSTextLight-Light", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
            case .SemiBold:
                return UIFont(name: "GESSTextBold-Bold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
            }
        }
    }
}
