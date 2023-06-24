//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            StoryPageView(stories: stories, pageIndex: 0)
        }
    }
}

#Preview {
    ContentView()
}
