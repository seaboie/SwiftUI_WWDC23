//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    UnevenRoundedRectangle(topLeadingRadius: 35, bottomLeadingRadius: 0, bottomTrailingRadius: 35, topTrailingRadius: 0, style: .continuous)
                        .fill(.red.gradient)
                        .frame(width: 100, height: 100)
                    
                    Rectangle()
                        .fill(.blue.gradient)
                        .frame(width: 100, height: 100)
                        .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 35, bottomTrailingRadius: 0, topTrailingRadius: 35, style: .circular))
                }
                VStack {
                    UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 35, bottomTrailingRadius: 0, topTrailingRadius: 35, style: .continuous)
                        .fill(.red.gradient)
                        .frame(width: 100, height: 100)
                    
                    Rectangle()
                        .fill(.blue.gradient)
                        .frame(width: 100, height: 100)
                        .clipShape(.rect(topLeadingRadius: 35, bottomLeadingRadius: 0, bottomTrailingRadius: 35, topTrailingRadius: 0, style: .circular))
                }
                
                
            }
            Rectangle()
                .fill(.orange)
                .frame(width: 25, height: 25)
                .clipShape(.circle)
        }
    }
    }
    
    #Preview {
        ContentView()
    }
