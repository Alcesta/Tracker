//
//  IntForDays.swift
//  Tracker
//
//  Created by Olga Ilyushina on 15.08.2024.
//

import Foundation

extension Int {
    func days() -> String {
        guard self >= 0 else {
            return "Некорректное значение"
        }
        let remainder10 = self % 10
        let remainder100 = self % 100
        
        switch (remainder10, remainder100) {
        case (1, _) where remainder100 != 11:
            return "\(self) день"
        case (2...4, _) where !(11...14 ~= remainder100):
            return "\(self) дня"
        default:
            return "\(self) дней"
            
        }
    }
}
