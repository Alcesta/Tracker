//
//  Tracker.swift
//  Tracker
//
//  Created by Olga Ilyushina on 13.08.2024.
//

import Foundation
import UIKit

struct Tracker {
    let id: UUID
    let name: String
    let color: UIColor
    let emoji: String
    let schedule: [Weekdays?]
    var dateEvent: Date?
}
