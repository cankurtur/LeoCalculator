//
//  DateExtension.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import Foundation

extension Date {
    
    class Format {
        public static var defaultDate: String = "yyyy-MM-dd"
    }
    
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var twoDaysBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
    }
    
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    func toString(withFormat format: String = Format.defaultDate) -> String {
        let formatter = Date.createFormatter(withDateFormat: format)
        return formatter.string(from: self)
    }
    
    fileprivate static func createFormatter(withDateFormat dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        return formatter
    }
    
}
