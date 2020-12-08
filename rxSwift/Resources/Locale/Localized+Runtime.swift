//
//  Localized+Runtime.swift
//  Crycle
//
//  Created by Mohammed Khaled on 18/01/19.
//  Copyright © 2019 Crycle. All rights reserved.
//
//
import Foundation

extension L10n {
    /*
     static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {

     //       let bundle: Bundle
     //        print(Language.currentLanguage())
     //        if let langPath = Bundle.main.path(forResource: Language.currentLanguage(), ofType: "lproj"),
     //            let langBundle = Bundle(path: langPath ) {
     //          bundle = langBundle
     //        } else {
     //            bundle =  Bundle.main
     //        }

     let format = NSLocalizedString(key, tableName: table, bundle: Bundle.main, comment: "")
     return String(format: format, locale: Locale.current, arguments: args)
     }
     */
    static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}
private final class BundleToken {}
