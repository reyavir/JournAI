//
//  JournalDataManager.swift
//  calhacks-mac
//
//  Created by Jason Lee on 6/23/24.
//

import Foundation
import SwiftData

class JournalDataManager: ObservableObject {
    @Published var entries: [JournalEntry] = []

    private let entriesKey = "JournalEntries"

    init() {
        loadEntries()
    }

    func addEntry() -> JournalEntry {
        let newEntry = JournalEntry(id: UUID(), title: "New Entry", date: Date(), content: "")
        entries.append(newEntry)
        return newEntry
    }

    private func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: entriesKey) {
            if let decodedEntries = try? JSONDecoder().decode([JournalEntry].self, from: data) {
                entries = decodedEntries
            }
        }
    }

    private func saveEntries() {
        if let encodedData = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encodedData, forKey: entriesKey)
        }
    }
}
