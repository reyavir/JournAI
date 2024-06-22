//
//  HealthView.swift
//  app
//
//  Created by Reya Vir on 6/22/24.
//

import SwiftUI

struct HealthView: View {
    
    @StateObject private var manager = HealthKitManager()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Health Tracking")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    HealthMetricView(title: "Steps", value: "\(manager.steps)", icon: "figure.walk")
                    HealthMetricView(title: "Sleep", value: String(format: "%.1f hrs", manager.sleepHours), icon: "bed.double.fill")
                    
                    HealthMetricView(title: "Heart Rate", value: "0 bpm", icon: "heart.fill") // TODO
                }
                .padding()
                
                Button(action: {
                    // TODO: Implement refresh action
                }) {
                    Text("Refresh Data")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.bottom)
    }
}

    
struct HealthMetricView: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(.blue)
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
    
#Preview {
    HealthView()
}
