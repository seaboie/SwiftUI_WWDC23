//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var showView: Bool = false;
    
    var body: some View {
        VStack {
            if (showView) {
                Text("Hello World")
            }
            Button("Show View") {
                withAnimation(.spring(), completionCriteria: .removed) {
                    showView.toggle()
                } completion: {
                    print("Completed But View Not Removed")
                }

            }
        }    }
}

#Preview {
    ContentView()
}
