//
//  MoodView.swift
//  app
//
//  Created by Reya Vir on 6/22/24.
//

import SwiftUI

struct MoodView: View {
    let emotions: [String] // Assuming these are the top 5 emotions
        let colors: [Color] = [.blue, .green, .orange, .purple, .red] // Colors for each emotion
        
    var body: some View {
        Spacer()
        VStack(spacing: 10) {
            Text("Your main moods today")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    ForEach(0..<emotions.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(colors[index % colors.count])
                            .frame(width: 300, height: 80)
                            .overlay(
                                Text(emotions[index])
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            )
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    MoodView(emotions: ["Happy", "Excited", "Calm", "Sad", "Angry"])
}
