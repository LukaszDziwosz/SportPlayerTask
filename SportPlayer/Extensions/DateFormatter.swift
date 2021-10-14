//
//  DateFormatter.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 11/10/2021.
//

import Foundation

extension DateFormatter {
    
    static let java: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        //add more modifiers for region
        return formatter
    }()
    
    static let short: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
    
    static func string(apiDate string: String) -> String {
        let date = DateFormatter.java.date(from: string)!
            return  DateFormatter.short.string(from: date)
        }
}
