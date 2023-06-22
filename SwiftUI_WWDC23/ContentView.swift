//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var isKeyframeAnimation: Bool = false
    var body: some View {
        VStack {
            Spacer()
            Image(.xcode)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .keyframeAnimator(initialValue: KeyframeInitial(), trigger: isKeyframeAnimation) { view, frame in
                    view
                        .scaleEffect(frame.scale)
                        .rotationEffect(frame.rotation, anchor: .bottom)
                        
                        .background {
                            view
                                .blur(radius: 1)
                                .rotation3DEffect(
                                    .init(degrees: 180),
                                    axis: (x: 10.0, y: 0.0, z: 0.0)
                                )
                                .mask {
                                   LinearGradient(colors: [
                                    .white.opacity(frame.reflectionOpacity),
                                    .white.opacity(frame.reflectionOpacity - 0.45),
                                    .white.opacity(frame.reflectionOpacity - 0.4992),
                                    .clear
                                   ], startPoint: .top, endPoint: .bottom)
                                }
                                .offset(y: 200)
                                
                        }
                        .offset(y: frame.offsetY)
                } keyframes: { value in
                    KeyframeTrack(\.offsetY) {
                        CubicKeyframe(0, duration: 0.15)
                        SpringKeyframe(-100, duration: 10, spring: .bouncy)
                        CubicKeyframe(500, duration: 0.2)
                        CubicKeyframe(1, duration: 0.3)
                    }
                    
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(0.3, duration: 0.15)
                        CubicKeyframe(3, duration: 0.3)
                        CubicKeyframe(2, duration: 0.3)
                        CubicKeyframe(1, duration: 0.3)
                        CubicKeyframe(0.1, duration: 0.3)
                        CubicKeyframe(0.2, duration: 0.3)
                        CubicKeyframe(1, duration: 0.3)
                    }
                    
                    KeyframeTrack(\.rotation) {
                        CubicKeyframe(.init(degrees: 0), duration: 0.1)
                        CubicKeyframe(.init(degrees: -40), duration: 2)
                        CubicKeyframe(.init(degrees: 40), duration: 2)
                        CubicKeyframe(.init(degrees: -280), duration: 5)
                        CubicKeyframe(.init(degrees: 360), duration: 0.8)
                    }
                    
                    KeyframeTrack(\.reflectionOpacity) {
                        CubicKeyframe(0, duration: 0.15)
                        CubicKeyframe(0.5, duration: 19)
                    }
                }

            
            Spacer()
            
            Button("Keyframes Animations") {
                isKeyframeAnimation.toggle()
            }
            .fontWeight(.bold)
        }
        .padding()
    }
}

struct KeyframeInitial {
    var scale: CGFloat = 1
    var offsetY: CGFloat = 0
    var rotation: Angle = .zero
    var reflectionOpacity: CGFloat = 0.5
}

#Preview {
    ContentView()
}
