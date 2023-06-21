//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(content: {
                ForEach(1...30, id: \.self) { num in
                    Rectangle()
                        .fill(.red)
                        .frame(height: 185)
                        .scrollTransition(topLeading: .interactive, bottomTrailing: .identity) { view, phase in
                            view
                                .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                            
                        }
                }
            })
            .padding(.horizontal, 30)
        })
    }
}

#Preview {
    ContentView()
}
