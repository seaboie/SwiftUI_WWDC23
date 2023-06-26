//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View, Sendable {
    
    @EnvironmentObject var fetcher: PandaCollectionFetcher
    @State private var memeText: String = ""
    @State private var textSize: Double = 60.0
    @State private var textColor: Color = Color.white
    
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            Spacer()
            
            LoadableImage(imageMetadata: fetcher.currentPanda)
                .overlay(alignment: .bottomTrailing) {
                    TextField("Meme Text", text: $memeText, prompt: Text(""))
                        .focused($isFocused)
                        .font(.system(size: textSize, weight: .heavy))
                        .shadow(radius: 10)
                        .foregroundColor(textColor)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                .frame(minHeight: 150)
            Spacer()
            
            if !memeText.isEmpty {
                VStack {
                    HStack {
                        Text("Font Size")
                            .fontWeight(.semibold)
                        Slider(value: $textSize, in: 20...140)
                    }
                    
                    HStack(content: {
                        Text("Font Color")
                            .fontWeight(.semibold)
                        ColorPicker("Font Color", selection: $textColor)
                            .labelsHidden()
                            .frame(width: 124, height: 23, alignment: .leading)
                        Spacer()
                    })
                }
                .padding(.vertical)
                .frame(maxWidth: 325)
            }
            
            HStack {
                Button(action: {
                    if let randomImage = fetcher.imageData.sample.randomElement() {
                        fetcher.currentPanda = randomImage
                    }
                }, label: {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Shuffle Photo")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                })
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Button(action: {
                    isFocused = true
                }, label: {
                    VStack {
                        Image(systemName: "textformat")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Add Text")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                })
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxHeight: 180, alignment: .center)
            
        }
        .padding()
        .task {
            try? await fetcher.fetchData()
        }
        .navigationTitle("Meme Creator")
    }
}

//
//#Preview {
//    ContentView()
//}
