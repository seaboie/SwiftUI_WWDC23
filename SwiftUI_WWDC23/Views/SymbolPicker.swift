//
//  SymbolPicker.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 24/6/2566 BE.
//

import SwiftUI

struct SymbolPicker: View {
    
    @Binding var symbol: Symbol?
    
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    let gridColumn = Array(repeating: GridItem(), count: 4)
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 100)
                .foregroundStyle(.gray.opacity(0.2))
                .overlay {
                    Text("Please Choose icon")
                        .font(.largeTitle)
                }
            ScrollView {
                LazyVGrid(columns: gridColumn, content: {
                    
                    ForEach(symbols) { symbol in
                        Button(action: {
                            self.symbol = symbol
                            dismiss()
                        }, label: {
                            Image(systemName: symbol.name)
                                .resizable()
//                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(.accentColor)
                                .ignoresSafeArea(.container, edges: .bottom)
                        })
                        .padding()
                        .buttonStyle(.plain)
                    }
                })
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SymbolPicker(symbol: .constant(nil))
}
