//
//  GoalsView.swift
//  app
//
//  Created by Reya Vir on 6/22/24.
//

import SwiftUI

struct Goal: Identifiable {
    let id = UUID()
    @State var title: String
    var color: Color
}

struct GoalsView: View {
    @State private var goals: [Goal] = []
    @State private var draggingItem: Goal?
    
    var body: some View {
        ZStack {
            List {
                Text("Weekly Goals")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                ForEach(goals) { goal in
                    GoalBox(goal: goal, editableTitle: "New Goal")
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            deleteGoal(goal)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                
            }
            .listStyle(PlainListStyle())
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: addNewGoal) {
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
        .navigationTitle("Goals")
    }
    func addNewGoal() {
        let newGoal = Goal(title: "New Goal", color: randomColor())
        goals.append(newGoal)
    }
    
    func deleteGoal(_ goal: Goal) {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals.remove(at: index)
        }
    }

    func randomColor() -> Color {
        let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink]
        return colors.randomElement()!
    }
    
}

struct GoalBox: View {
    let goal: Goal
    @State var isEditing = false
    @State var editableTitle: String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(goal.color)
                .frame(width: 50, height: 50)
            
            if isEditing {
                TextField("Enter goal", text: $editableTitle, onCommit: {
                    goal.title = editableTitle
                    isEditing = false
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text(goal.title)
                    .font(.headline)
                    .onTapGesture {
                        editableTitle = goal.title
                        isEditing = true
                    }
            }
            
            Spacer()
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        
    }
}

#Preview {
    GoalsView()
}
