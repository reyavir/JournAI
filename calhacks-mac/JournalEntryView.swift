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
    @State var title = "Journal Entry"
    @State private var isSidebarVisible = false
    @State private var suggestions: [String] = [
        "What did you accomplish today?",
        "How are you feeling right now?",
        "What are you grateful for?"
    ]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            VStack {
                TextField("Journal Entry", text: $title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(formattedDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                TextEditor(text: $journalEntry)
                    .frame(minHeight: 200)
                    .padding()
//                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                Spacer()
            }
            .padding()
            
            
            Button(action: {
                withAnimation {
                    isSidebarVisible.toggle()
                }
            }) {
                Image(systemName: isSidebarVisible ? "chevron.right" : "chevron.left")
                    .foregroundColor(.gray)
                    .padding(8)
//                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            
            // Collapsible sidebar
            if isSidebarVisible {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Suggestions")
                        .font(.headline)
                    
                    ForEach(suggestions.indices, id: \.self) { index in
                        FlowingText(text: suggestions[index], delay: Double(index) * 0.5)
                    }
//                    Spacer()
                    
                    HStack {
                        Spacer()
                        SiriAnimation()
                            .frame(width: 60, height: 60)
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .frame(width: 250)
//                .background(Color(.systemGray6))
                .cornerRadius(15)
                .transition(.move(edge: .trailing))
            }
        }
        .padding()
        .toolbar {
            // 2
            ToolbarItem() {

                Button {
                    // 3
                    presentationMode.wrappedValue.dismiss()

                } label: {
                    // 4
                    HStack {

                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
            }
        }
        .navigationTitle("Journal Entry")
    }
    
        var formattedDate: String {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter.string(from: currentDate)
        }
    
    func getSuggestions() {
        guard let url = URL(string: "https://mullet-bursting-literally.ngrok-free.app/") else {
            print("Invalid URL")
            return
        }
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create the URLSession task
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Parse the response
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let suggestions = jsonResult["suggestions"] as? [String] {
                    DispatchQueue.main.async {
                        self.suggestions = suggestions
                    }
                }
            } catch {
                print("Failed to parse response: \(error)")
            }
        }.resume()
    }
}

struct FlowingText: View {
    let text: String
    let delay: Double
    
    @State private var displayed = ""
    
    var body: some View {
        Text(displayed)
            .onAppear {
                animateText()
            }
    }
    
    private func animateText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            for (index, character) in text.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                    displayed += String(character)
                }
            }
        }
    }
}

#Preview {
    JournalView().frame(width: 800, height: 500)
}
