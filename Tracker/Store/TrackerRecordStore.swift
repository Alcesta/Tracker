//
//  TrackerRecordStore.swift
//  Tracker
//
//  Created by Olga Ilyushina on 10.09.2024.
//

import Foundation
import UIKit
import CoreData

final class TrackerRecordStore: NSObject {
    private let context: NSManagedObjectContext
    private var fetchedResultsController: NSFetchedResultsController<TrackerRecordCoreData>?
    
    convenience override init() {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Can't get context")
        }
        self.init(context: context)
    }
    
    init(context: NSManagedObjectContext) {
        self.context = context
        super.init()
    }
    
    func completedDays(for id: UUID) throws -> [Date] {
        return try fetchDays(for: id)
    }
    
    func fetchDays(for id: UUID) throws -> [Date] {
        let fetchRequest: NSFetchRequest<TrackerRecordCoreData> = TrackerRecordCoreData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        let result = try context.fetch(fetchRequest)
        let dates = result.compactMap { $0.date }
        return dates
    }

    func addOrDeleteRecord(id: UUID, date: Date) throws {
        if let existingRecord = try fetchRecord(id: id, date: date) {
            context.delete(existingRecord)
        } else {
            if date <= Date().dateWithoutTime() {
                let newRecord = TrackerRecordCoreData(context: context)
                newRecord.id = id
                newRecord.date = date
            }
        }
        try context.save()
    }
    
    private func fetchRecord(id: UUID, date: Date) throws -> TrackerRecordCoreData? {
        let fetchRequest: NSFetchRequest<TrackerRecordCoreData> = TrackerRecordCoreData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@ AND date == %@", id as CVarArg, date as CVarArg)
        do {
            let result = try context.fetch(fetchRequest)
            return result.first
        } catch {
            throw error
        }
    }
}
