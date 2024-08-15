//
//  CreateTrackerViewController.swift
//  Tracker
//
//  Created by Olga Ilyushina on 15.08.2024.
//

import Foundation
import UIKit

protocol CreateTrackerViewControllerDelegate: AnyObject {
    func updateListOfTrackers(newTracker: TrackerCategory)
}

