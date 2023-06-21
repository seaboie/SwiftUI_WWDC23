//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    
    
    let colors: [Color] = [.red, .blue, .green, .yellow, .purple];
    @State private var scrollPosition: Color?;
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.white)
            Rectangle()
                .fill(.white)
                .overlay(content: {
                    GeometryReader { geo in
                        let w = geo.size.width;
                        let h = geo.size.height;
                        (
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: w * 0.05) {
                                    ForEach(colors, id: \.self) { color in
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(color.gradient)
                                            .frame(width: w * 0.75, height: h * 0.65)
                                    }
                                }
                                .padding(.horizontal, (w - (w * 0.75)) / 2)
                                .scrollTargetLayout()       // 1. must have
                            }
                                .scrollTargetBehavior(.viewAligned)     // 2. must have
                                .scrollPosition(id: $scrollPosition)    // 3. Scroll to position
                        )
                        
                    }
                    .overlay(alignment: .bottom) {
                        HStack {
                            ForEach(colors, id: \.self) { color in
                                RoundedRectangle(cornerRadius: scrollPosition == color ? 200 : 0)
                                    .fill(Color(color.opacity(scrollPosition == color ? 1 : 0.9)))
                                    .frame(width: scrollPosition == color ? 30 : 12, height: 10)
                                    .onTapGesture {
                                        withAnimation {
                                            scrollPosition = color
                                        }
                                    }
                            }
                        }
                    }
                    
                })
            Rectangle()
                .fill(.white)
            
        }
    }
}

#Preview {
    ContentView()
}
