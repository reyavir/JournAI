//
//  JournalView.swift
//  app
//
//  Created by Reya Vir on 6/22/24.
//

import SwiftUI

struct JournalView: View {
    @State var journalEntry: String = "Type your journal entry here"
    @State var currentDate = Date()
        
        var body: some View {
            
            VStack {
                Text("Journal Entry")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                Text(formattedDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                TextEditor(text: $journalEntry)
                    .frame(minHeight: 200)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Journal Entry")
        }
    
        var formattedDate: String {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter.string(from: currentDate)
        }
}

#Preview {
    JournalView()
}
