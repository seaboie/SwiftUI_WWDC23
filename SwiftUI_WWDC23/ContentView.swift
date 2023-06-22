//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var value: CGFloat = 0;
    
    var body: some View {
        VStack {
            
            Button(
                "Show View"
            ) {
                value = 10
            }
        }
        .onChange(of: value, initial: true) { oldValue, newValue in
            print(oldValue, newValue)
        }
    }
}

#Preview {
    ContentView(
    )
}
