//
//  DateFormatter+Extensions.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 21.7.24..
//

import Foundation

extension DateFormatter {
    public static func formatter(withStyle dateFormatStyle: CustomDateFormatStyle) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormatStyle.rawValue
        return dateFormatter
    }
    
    public enum CustomDateFormatStyle {
        case jsonSimplified
        case hourMinute
        case monthDayHourMinute
        
        var rawValue: String {
            switch self {
                case .jsonSimplified: return "yyyy-MM-dd"
                case .hourMinute: return "HH:mm"
                case .monthDayHourMinute: return "MM-dd HH:mm"
            }
        }
    }
}
