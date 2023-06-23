//
//  FunFactsView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 23/6/2566 BE.
//

import SwiftUI

struct FunFactsView: View {
    
    @State private var funFact: String = ""
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            
            Button("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
        }
        .padding()
    }
}

#Preview {
    FunFactsView()
}
