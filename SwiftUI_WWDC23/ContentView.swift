//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .blue, .green, .yellow, .purple];
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.green)
            Rectangle()
                .fill(.white)
                .overlay(content: {
                    GeometryReader { geo in
                        let w = geo.size.width;
                        (
                            ScrollView(.horizontal) {
                                LazyHStack(spacing: w * 0.05) {
                                    ForEach(colors, id: \.self) { color in
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(color.gradient)
                                            .frame(width: w * 0.75)
                                    }
                                }
                                .padding(.horizontal, (w - (w * 0.75)) / 2)
                                .scrollTargetLayout()
                            }
                                .scrollTargetBehavior(.viewAligned)
                            
                        )
                        
                    }
                    
                })
            Rectangle()
                .fill(.blue)
        }
    }
}

#Preview {
    ContentView()
}
