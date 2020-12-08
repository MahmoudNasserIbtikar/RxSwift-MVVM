//
//  LanguageManager.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation

public enum Langugage:String {
    case arabic = "ar"
    case english = "en"
    case notSet = "En"
}

class LanguageManager: NSObject {
    
    static let sharedInstance = LanguageManager()
    
    private var _currentLanguage:Langugage = .notSet
    
    private var currentLangugae:Langugage {
        set {
            _currentLanguage = newValue
        }
        get {
            if _currentLanguage == .notSet {
                if let deviceLang = NSLocale.preferredLanguages.first {
                    return deviceLang.contains("ar") ? .arabic  : .english
                } else {
                    return .english
                }
            } else {
                return _currentLanguage
            }
        }
    }
    
    
    
    var applicationLanguage:Langugage? {
        set {
            UserDefaults.standard.set(newValue?.rawValue, forKey: "APPLICATION_LANGUAGE")
            UserDefaults.standard.synchronize()
        }
        
        get {
            let userDefaultValue = UserDefaults.standard.value(forKey: "APPLICATION_LANGUAGE")
            if let langugage = userDefaultValue {
                if let langugage = Langugage(rawValue: langugage as! String) {
                    return langugage
                }
            }
            
            return .notSet
        }
    }
    
    func changeLangugage(lang: Langugage) {
        if lang != currentLangugae {
            currentLangugae = lang
        }
    }
}
