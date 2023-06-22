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
            if showView {
                Rectangle()
                    .fill(.red.gradient)
                    .frame(width: 150, height: 150)
                    .transition(MyTransition())
                    
            }
            
            Button("Show View") {
                withAnimation {
                    showView.toggle();
                }
            }
        }
    }
}

struct MyTransition: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
         content
            
            .rotation3DEffect(
                .init(degrees: phase.value * (phase == .willAppear ? 90 : -90)),
                                      axis: (x: 1.0, y: 0.0, z: 0.0)
            )
    }
}

#Preview {
    ContentView()
}
