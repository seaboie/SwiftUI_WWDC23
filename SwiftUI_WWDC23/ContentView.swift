//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI


struct ContentView: View {
    
    @State private var value: String = ""
    
    var body: some View {
        
        MoodViewFull(value: $value)
            .padding()
    }
}

#Preview {
    ContentView()
}

struct MoodViewFull: View {
    @Binding var value: String
    private let emojis = ["😢", "😴", "😁", "😡", "😐"]
    
    var body: some View {
        VStack {
            Text("What's your mood?")
                .font(.headline)
                .foregroundColor(.darkBrown)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Button {
                        withAnimation {
                            value = emoji
                        }
                    } label: {
                        VStack {
                            Text(emoji)
                                .font(.system(size: value == emoji ? 65 : 35))
                                .frame(maxWidth: .infinity)
                                .padding(.bottom)
                            Image(systemName: value == emoji ? "circle.fill" : "circle")
                                .font(.system(size: 16))
                                .foregroundColor(.darkBrown)
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(minHeight: 100, maxHeight: 200)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.gray.opacity(0.4))
        }
    }
}
