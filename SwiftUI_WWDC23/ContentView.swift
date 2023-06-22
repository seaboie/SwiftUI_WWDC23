//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var feedback: Bool = false
    
    var body: some View {
        Button("Send Haptics Feedback") {
            feedback.toggle();
        }
        .sensoryFeedback(.warning, trigger: feedback)
    }
}

#Preview {
    ContentView()
}
