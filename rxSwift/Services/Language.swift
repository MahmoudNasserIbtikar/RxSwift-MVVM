//
//  Language
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved..
//

import UIKit

enum Language: String {
    
    case english = "en"
    case arabic = "ar"
    
    var semantic: UISemanticContentAttribute {
        switch self {
        case .arabic:
            return .forceRightToLeft
        default:
            return .forceLeftToRight
        }
    }
    
    var languageCode: String {
        switch self {
        case .arabic: return "ar"
        case .english: return "en"
        }
    }
    
    var languageNumber: Int {
        switch self {
        case .arabic: return 1
        case .english: return 2
        }
    }
    
    var languageName: String {
        let locale: NSLocale = NSLocale(localeIdentifier: self.languageCode)
        let displayName = locale.displayName(forKey: NSLocale.Key.identifier,
                                             value: self.languageCode) ?? self.languageCode
        return displayName
    }
}
