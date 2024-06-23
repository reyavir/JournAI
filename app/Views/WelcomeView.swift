//
//  WelcomeView.swift
//  app
//
//  Created by Reya Vir on 6/22/24.
//

import SwiftUI

struct WelcomeView: View {
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                SectionList(entries: [
                    ("Journal Entries", "book.closed", Color.blue),
                    ("Health Tracking", "heart.circle", Color.red),
                    ("Weekly Goals", "flag.circle", Color.green),
                    ("Mood Tracking", "face.smiling", Color.yellow),
                    ("Exercise Log", "figure.walk", Color.orange),
                    ("Meal Planner", "fork.knife", Color.purple),
                    ("Sleep Analysis", "bed.double", Color.indigo)
                ])
            }
//            .navigationTitle("Dashboard")
            
            VStack {
                Text("Welcome to [App Name]")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()

                VStack(spacing: 20) {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                .padding()

                Spacer()
            }
            .padding()
        }
        
    }
}

struct SectionList: View {
    let entries: [(String, String, Color)]
    
    var body: some View {
        ForEach(entries, id: \.0) { entry in
            Section {
                Label {
                    Text(entry.0)
                        .foregroundColor(.black)
                } icon: {
                    Image(systemName: entry.1)
                        .foregroundColor(entry.2)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}

