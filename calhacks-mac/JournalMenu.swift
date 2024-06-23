//
//  JournalMenu.swift
//  calhacks-mac
//
//  Created by Jason Lee on 6/23/24.
//

import SwiftUI
import Foundation

struct JournalMenu: View {
    @ObservedObject var dataManager = JournalDataManager()
    @State private var selectedEntry: JournalEntry?

    var body: some View {
        ZStack {
            List(dataManager.entries) { entry in
                NavigationLink( destination: JournalView(journalEntry: entry.content) ){
                    VStack(alignment: .leading) {
                        Text(entry.title)
                            .font(.headline)
                        Text(entry.date, style: .date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        selectedEntry = entry
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(
                        destination: JournalView(journalEntry: "ENTER TEXT")
                    ) {
                        Button(action: addNewJournal) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.blue)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                    }
                }
            }
        }
        .navigationTitle("Your Journals")
        .background(
            NavigationLink(
                destination: JournalView(journalEntry: "yes")
            ) {
                
                EmptyView()
            }
            .hidden()
        )
    }
    
    func addNewJournal() {
        let newEntry = dataManager.addEntry()
        selectedEntry = newEntry
    }
}


#Preview {
    JournalMenu()
}
