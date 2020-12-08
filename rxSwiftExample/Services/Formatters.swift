//
//  Formatters.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation

internal class Formatters {
    
    lazy var formatter = Formatters()

    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.locale = Locale(identifier: "ar") //Locale(identifier: "ar-SA")
        return formatter
    }()
    
    private lazy var languageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.locale = Locale(identifier: "ar")
        return formatter
    }()
    
    /// return localized number in arabic for Quran pages
    func localizeNumber(toArabic page: Int) -> String {
        let number = NSNumber(value: page)
        return numberFormatter.string(from: number) ?? ""
    }
    
    /// return localized number in arabic for Quran pages
    func localize(number: Int) -> String {
        let value = NSNumber(value: number)
        return languageFormatter.string(from: value) ?? ""
    }
}
