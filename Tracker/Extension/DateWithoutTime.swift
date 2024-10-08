//
//  DateWithoutTime.swift
//  Tracker
//
//  Created by Olga Ilyushina on 10.09.2024.
//

import Foundation

extension Date {
    func dateWithoutTime() -> Date {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: dateComponents) ?? self
    }
}
