//
//  StoryPageView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 24/6/2566 BE.
//

import SwiftUI

struct StoryPageView: View {
    
    let stories: [StoryPage];
    let pageIndex: Int
    
    var body: some View {
        VStack {
            ScrollView {
                Text(stories[pageIndex].text)
            }
            
            ForEach(stories[pageIndex].choices, id: \Choice.text) { choice in
                NavigationLink(destination: StoryPageView(stories: stories, pageIndex: choice.destination)) {
                    Text(choice.text)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(.gray.opacity(0.25))
                        .cornerRadius(8)
                }
            }
            
            
        }
        .padding()
        .navigationTitle("Page \(pageIndex + 1)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StoryPageView(stories: stories, pageIndex: 0)
}
