//
//  File.swift
//
//
//  Created by Casper Kønigsfeldt on 03/10/2023.
//

import Foundation

extension Date {
    public func toString(format: String, locale: String) -> String {
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: locale)
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
    
    
    public var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    public var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    public var startOfWeek: Date {
        Calendar.current.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
    }
    
    public var endOfWeek: Date {
        var components = DateComponents()
        components.weekOfYear = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfWeek)!
    }
    
    public var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }
    
    public var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
    
    public var startOfYear: Date {
        let components = Calendar.current.dateComponents([.year], from: startOfDay)
        return Calendar.current.date(from: components)!
    }
    
    public var endOfYear: Date {
        var components = DateComponents()
        components.month = 12
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfYear)!
    }
    
    public func dayOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
