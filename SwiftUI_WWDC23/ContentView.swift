//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView {
            
            Rectangle()
                .fill(.red)
                .frame(height: 120)
                .visualEffect { view, proxy in
                    view
                        .offset(y: proxy.bounds(of: .scrollView)?.minY ?? 0)
                }
                .zIndex(1)
            LazyVStack {
                ForEach(1...30, id: \.self) { item in
                    Rectangle()
                        .fill(.blue.gradient)
                        .frame(height: 35)
                }
                .padding(.horizontal, 35)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        

    }
}

#Preview {
    ContentView()
}
