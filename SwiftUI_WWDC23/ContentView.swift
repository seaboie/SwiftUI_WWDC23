//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimatedSymbol: Bool = true;
    
    var body: some View {
            Image(systemName: "suit.heart.fill")
            .font(.largeTitle)
            .foregroundStyle(.red)
            .symbolEffect(.pulse, options: .repeating, value: isAnimatedSymbol)
            .onTapGesture {
                    isAnimatedSymbol.toggle()
            }
    }
}

#Preview {
    ContentView()
}
