//
//  StoryView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 23/6/2566 BE.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            Text("My Story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            ScrollView {
                Text(information.story)
                    .font(.title)
                    .padding()
            }
        }
        .padding([.top, .bottom], 50)
    }
}

#Preview {
    StoryView()
}
