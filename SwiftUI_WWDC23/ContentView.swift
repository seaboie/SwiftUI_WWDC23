//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var isStartSwitching: Bool = false
    
    var body: some View {
        
        PhaseAnimator(SFImage.allCases, trigger: isStartSwitching) { equatable in
            ZStack {
                Circle()
                    .fill(equatable.color.gradient)
                Image(systemName: equatable.rawValue)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
            }
            .frame(width: 100, height: 100)
        } animation: { symbol in
            switch symbol {
            case .heart:
                    .smooth(duration: 2, extraBounce: 0)
            case .house:
                    .bouncy(duration: 2, extraBounce: 0)
            case .iphone:
                    .interactiveSpring(duration: 2, extraBounce: 0, blendDuration: 0.2)
            }
            
        }
        .onTapGesture {
            isStartSwitching.toggle()
        }
    }
}

#Preview {
    ContentView()
}

enum SFImage: String, CaseIterable {
    case heart = "suit.heart.fill"
    case house = "house.fill"
    case iphone = "iphone"
    
    var color: Color {
        switch self {
        case .heart:
            return .red
        case .house:
            return .blue
        case .iphone:
            return .yellow
        }
    }
}
