//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    let columnLayout = Array(repeating: GridItem(), count: 3)

    @State private var selectedColor: Color = Color.gray
    
    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]
    
    var body: some View {
        VStack {
            Text("Selected Color")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: columnLayout, content: {
                    
                    ForEach(allColors, id: \.self) { color in
                        Button {
                            selectedColor = color
                        } label: {
                            RoundedRectangle(cornerRadius: 4)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color)
                        }
                    }
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
