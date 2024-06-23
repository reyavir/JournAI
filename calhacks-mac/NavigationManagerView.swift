//
//  NavigationManagerView.swift
//  calhacks-mac
//
//  Created by Jason Lee on 6/23/24.
//

import SwiftUI

enum SideBarItem: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    
    case Journals
    case Goals
    case Mood
}

struct NavigationManagerView: View {
    @State var sideBarVisibility: NavigationSplitViewVisibility = .doubleColumn
    @State var selectedSideBarItem: SideBarItem = .Journals
    
    var body: some View {
        NavigationSplitView(columnVisibility: $sideBarVisibility) {
            List(SideBarItem.allCases, selection: $selectedSideBarItem) { item in
                NavigationLink(
                    item.rawValue.localizedCapitalized,
                    value: item
                )
            }
            
        } detail : {
            switch selectedSideBarItem {
            case .Journals:
                JournalMenu()
            case .Goals:
                GoalsView()
            case .Mood:
                MoodView(emotions:  ["Happy", "Excited", "Calm", "Sad", "Angry"])
            }
        }
    }
}

#Preview {
    NavigationManagerView()
}
