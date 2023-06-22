//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showView: Bool = false;
    
    @State private var randomString = ""
    
    var body: some View {
        
        VStack {
            if showView {
                Rectangle()
                    .fill(.red.gradient)
                    .frame(width: 150, height: 150)
                    .transition(MyTransition())
                
            }
            
            Button("Show View") {
                withAnimation(.init(MyAnimation())) {
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

struct MyAnimation: CustomAnimation {
    var duration: CGFloat = 1;
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        
        if time > duration {
            return nil
        }
        return value.scaled(by:  easeOutBounce(time / duration))
    }
    
    func easeOutBounce(_ x: TimeInterval) -> CGFloat {
        let n1 = 7.5625
        let d1 = 2.25
        var x: TimeInterval = x
        
        if (x < 1 / d1) {
            return n1 * x * x
        } else if (x < 2 / d1) {
            x -= 1.5 / d1
            return n1 * x * x + 0.75
        } else if (x < 2.5 / d1) {
            x -= 2.25 / d1
            return n1 * x * x + 0.9375
        } else {
            x -= 2.625 / d1
            return n1 * x * x + 0.984375
        }
    }
}



#Preview {
    ContentView()
}
