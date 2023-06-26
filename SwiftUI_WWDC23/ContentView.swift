//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

enum Sizes : String {
    case large = "ใหญ่"
    case small = "เล็ก"
    case medium = "กลาง"
}

struct ContentView: View {
    @State private var profileImageSize: Sizes = Sizes.large
    @State private var sendReadReceipts: Bool = true
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.white)
                .overlay(alignment: .topLeading) {
                    IconView()
                }
            VStack(alignment: .leading) {
                
                HalfCard()
                HalfCard()
                    .rotationEffect(.degrees(180))
                
            }
            .foregroundColor(.red)
            
            Rectangle()
                .foregroundColor(.white)
                .overlay(alignment: .bottomTrailing) {
                    IconView()
                        .rotationEffect(.degrees(180))
                }
        }
        .padding(22)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black)
        )
        .aspectRatio(0.7, contentMode: .fit)
        .padding()
        
        
    }
}

#Preview {
    ContentView()
}
