//
//  DateExtension.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import Foundation

extension Date {
    
    final class Format {
        public static var defaultDate: String = "yyyy-MM-dd"
    }
    
    static var twoDaysBefore: Date { return Date().twoDaysBefore }

    var twoDaysBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: noon) ?? Date()
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self) ?? Date()
    }
    
    func toString(withFormat format: String = Format.defaultDate) -> String {
        let formatter = Date.createFormatter(withDateFormat: format)
        return formatter.string(from: self)
    }
    
    private static func createFormatter(withDateFormat dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        return formatter
    }
}
