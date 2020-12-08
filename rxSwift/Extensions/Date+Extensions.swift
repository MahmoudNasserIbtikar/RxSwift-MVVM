//
//  Date+Extensions.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation

extension Date {
//    func getFullDate() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: LocalizationManager.currentLanguage().languageCode)
//        dateFormatter.setLocalizedDateFormatFromTemplate("dd MM YYYY")
//
//        let fullDate =  dateFormatter.string(from: self)
//
//        return fullDate
//    }
    
    func getFullDate() -> String {
        let day = self.getDay()
        let month = self.getMonth(template: "MM")
        let year = self.getYear()
        
        return "\(day)/\(month)/\(year)"
    }
    
    func getDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: LocalizationManager.currentLanguage().languageCode)
        dateFormatter.setLocalizedDateFormatFromTemplate("dd")
       
        let fullDate =  dateFormatter.string(from: self)
        
        return fullDate
    }
    
    func getTime12() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: LocalizationManager.currentLanguage().languageCode)
        dateFormatter.setLocalizedDateFormatFromTemplate("hh a")
        
        if LocalizationManager.currentLanguage() == .arabic {
            dateFormatter.pmSymbol = "م"
            dateFormatter.amSymbol = "ص"
        } else {
            dateFormatter.pmSymbol = "pm"
            dateFormatter.amSymbol = "am"
        }
        
        let timeDate =  dateFormatter.string(from: self)
        
        return timeDate
    }
    
    func getMonth(template: String = "MMM") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: LocalizationManager.currentLanguage().languageCode)
        dateFormatter.setLocalizedDateFormatFromTemplate(template)
       
        let fullDate =  dateFormatter.string(from: self)
        
        return fullDate
    }
    
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: LocalizationManager.currentLanguage().languageCode)
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy")
       
        let fullDate =  dateFormatter.string(from: self)
        
        return fullDate
    }
    
    
    func getDateAndTime() -> String {
        
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        print(localTimeZoneAbbreviation)
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM yy, hh:mm a")
//        dateFormatter.pmSymbol = L10n.Orders.pmSymbol
//        dateFormatter.amSymbol = L10n.Orders.amSymbol
        dateFormatter.locale = Locale(identifier: LocalizationManager.currentLanguage().languageCode)
        let time =  dateFormatter.string(from: self)
        
        if time.contains(",") {
            
            if let timeString = time.split(separator: ",").last {
                return String(timeString)
            }
        } else if time.contains("،") {
            if let timeString = time.split(separator: "،").last {
                return String(timeString)
            }
        }
        
        return ""
    }
    
    
        func getTime() -> String {
            
            var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
            print(localTimeZoneAbbreviation)
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm a")
            dateFormatter.locale = Locale(identifier: LocalizationManager.currentLanguage().languageCode)
            let time =  dateFormatter.string(from: self)
            
//            if time.contains(",") {
//
//                if let timeString = time.split(separator: ",").last {
//                    return String(timeString)
//                }
//            } else if time.contains("،") {
//                if let timeString = time.split(separator: "،").last {
//                    return String(timeString)
//                }
//            }
            
            return time
        }
    
    func getTime24() -> String {
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)!
                
        let currentHour = calendar.component(.hour, from: Date())
        let currentMinutes = calendar.component(.minute, from: Date())
        
        return "\(currentHour):\(currentMinutes)"
    }
    
    func getDayOfWeek(_ todayDate: Date) -> Int? {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return (weekDay - 1)
    }
}

extension Date {
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}
        
        return localDate
    }
}

extension DateFormatter {
    class var serverFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm ss"
        formatter.timeZone = TimeZone(identifier: "Asia/Riyadh")//"UTC+3"
        return formatter
    }
}
