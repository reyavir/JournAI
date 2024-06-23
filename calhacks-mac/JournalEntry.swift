//
//  JournalEntry.swift
//  calhacks-mac
//
//  Created by Jason Lee on 6/23/24.
//

import Foundation
import SwiftData

@Model
final class JournalClass : Identifiable{
    @Attribute(.unique) var uuid: String = UUID().uuidString
    var title: String
    var date: Date
    var content: String
    
    init (uuid: String = UUID().uuidString, title: String, date: Date, content: String)
    {
        self.title = title
        self.date = date
        self.content = content
    }
}

struct JournalEntry: Identifiable, Codable {
    let id: UUID
    var title: String
    var date: Date
    var content: String
}
