//
//  String.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import UIKit

//swiftlint:disable all
//MARK: - RegEx Enum

enum RegEx: String {
    case arabicAlphabet = "[\u{0627}-\u{06FF}]"
    case arabicNumbers = "[\u{0660}-\u{0669}]"
    case englishAlphabet = "[A-Za-z]"
}

extension String{
    public var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var timmedAllSpaces: String{
        return self.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "")
    }
    
    /// Converts numeric String to English numerics.
    /// #IMPORTANT: String must be numeric.
    public var englishNumbers: String {
        let cfstr = NSMutableString(string: self) as CFMutableString
        var range = CFRange(location: 0, length: CFStringGetLength(cfstr))
        // Do the transliteration (this mutates `cfstr`):
        CFStringTransform(cfstr, &range, kCFStringTransformToLatin, false)
        // Convert result back to a Swift string:
        return (cfstr as String)
    }
    
    /// Converts numeric String to English numerics.
    /// #IMPORTANT: String must be numeric.
    public var arabicNumbers: String {
        let cfstr = NSMutableString(string: self) as CFMutableString
        var range = CFRange(location: 0, length: CFStringGetLength(cfstr))
        // Do the transliteration (this mutates `cfstr`):
        CFStringTransform(cfstr, &range, kCFStringTransformLatinArabic, false)
        // Convert result back to a Swift string:
        return (cfstr as String)
    }
    
    /// Check if String is a decimal digit
    public var isNumber: Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
    
    
    /// Checks if the string contains numbers
    public var containsNumbers: Bool {
        let decimalCharacters = NSCharacterSet.decimalDigits
        let decimalRange = self.rangeOfCharacter(from: decimalCharacters, options: String.CompareOptions.literal, range: nil)
        if decimalRange != nil {
            print("Invalid name: Contains numbers")
            return true
        }
        return false
    }
    
    /// Checks if the string is an integer sequence
    public var isInt: Bool {
        return Int(self) != nil
    }
    
    
    /// Checks if it contains special characters
    public var containsSpecialCharacters: Bool {
        let specialCharacters: CharacterSet = CharacterSet(charactersIn: "~!@#$%^&*()_+><?.,\\|«»،\"±§`;:'-=[]{}€£¥₤")
        if self.rangeOfCharacter(from: specialCharacters) != nil {
            print("Invalid name: Contains special characters. ")
            return true
        }
        return false
    }
    
    /// Checks of the string contains Arabic and English
    public var containsMixedLanguage: Bool {
        if self.match(for: .englishAlphabet).count > 0 && self.match(for: .arabicAlphabet).count > 0  {
            print("Invalid name: Cannot contain Arabic and English alphabets at the same time")
            return true
        }
        return false
    }
    
//    /// Checks if String contains emojis
//    public var containsEmoji: Bool {
//        for scalar in unicodeScalars {
//            switch scalar.value {
//            case 0x1F600...0x1F64F, // Emoticons
//            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
//            0x1F680...0x1F6FF, // Transport and Map
//            0x2600...0x26FF,   // Misc symbols
//            0x2700...0x27BF,   // Dingbats
//            0xFE00...0xFE0F:   // Variation Selectors
//                return true
//            default:
//                continue
//            }
//        }
//        return false
//    }
    
    func match(for regex: RegEx) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex.rawValue)
            let nsstring = self as NSString
            let result = regex.matches(in: self, range: NSRange(location: 0, length: nsstring.length))
            return result.map { nsstring.substring(with: $0.range)}
        } catch (let error){
            
            print(error.localizedDescription)
        }
        return []
    }
    
    public var alphanumeric: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}

extension String {
    
    var url: URL? {
        var url: URL?
        url = URL(string: self)
        if url == nil {
            let encodeString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            if let encodeString = encodeString {
                url = URL(string: encodeString)
            }
        }
        return url
    }
    
    var isEmptyString: Bool {
        return self.trimmingWhitespacesAndNewlines.isEmpty
    }
    
    var trimmingWhitespacesAndNewlines: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude,
                                    height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}

extension Notification.Name {
    static let pageControlChanged = Notification.Name("page_control_changed")
    static let refreshCommentsList = Notification.Name("refresh_comments")
    static let refreshUserLikes = Notification.Name("refresh_user_likes")
    static let refreshMyChoices = Notification.Name("refresh_user_choices")
    static let userImageUpdated = Notification.Name("user_image_updated")
    static let notificationFCMToken = Notification.Name("FCMToken")
    static let languageChanged = Notification.Name("languageChanged")
    static let refreshFilter = Notification.Name("refreshFilter")
    static let willEnterForground = Notification.Name("willEnterForground")
    static let chatPayload = Notification.Name("chatPayload")

}

extension Bundle {
    /// SwifterSwift: App's current version (if applicable).
    public static var appVersionNumber: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// SwifterSwift: App current build number (if applicable).
    public static var appBuildNumber: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
}

extension NSAttributedString {
    //swiftlint:disable all
    convenience init(htmlString html: String, font: UIFont? = nil, useDocumentFontSize: Bool = true) throws {
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        let data = html.data(using: .utf8, allowLossyConversion: true)
        guard (data != nil), let fontFamily = font?.familyName, let attr = try? NSMutableAttributedString(data: data!, options: options, documentAttributes: nil) else {
            try self.init(data: data ?? Data(html.utf8), options: options, documentAttributes: nil)
            return
        }
        
        let fontSize: CGFloat? = useDocumentFontSize ? nil : font!.pointSize
        let range = NSRange(location: 0, length: attr.length)
        attr.enumerateAttribute(.font, in: range, options: .longestEffectiveRangeNotRequired) { attrib, range, _ in
            if let htmlFont = attrib as? UIFont {
                let traits = htmlFont.fontDescriptor.symbolicTraits
                var descrip = htmlFont.fontDescriptor.withFamily(fontFamily)
                
                if (traits.rawValue & UIFontDescriptor.SymbolicTraits.traitBold.rawValue) != 0 {
                    descrip = descrip.withSymbolicTraits(.traitBold)!
                }
                if (traits.rawValue & UIFontDescriptor.SymbolicTraits.traitItalic.rawValue) != 0 {
                    descrip = descrip.withSymbolicTraits(.traitBold)!
                }
                
                attr.addAttribute(.font, value: UIFont(descriptor: descrip, size: fontSize ?? htmlFont.pointSize), range: range)
            }
        }
        
        self.init(attributedString: attr)
    }
}

extension String {
    func getStringIndexes(indexes: [Int]) -> [String.Index] {
        var stringIndexes: [String.Index] = []
        
        for index in indexes {
            stringIndexes.append(self.index(self.startIndex, offsetBy: index))
        }
        
        return stringIndexes
    }
    
    func subString(from index1: Int, to index2: Int) -> String {
        let stringIndexs = self.getStringIndexes(indexes: [index1, index2])
        
        let startStringIndex = stringIndexs[0]
        let endStringIndex = stringIndexs[1]
        return String(self[startStringIndex...endStringIndex])
    }
}
