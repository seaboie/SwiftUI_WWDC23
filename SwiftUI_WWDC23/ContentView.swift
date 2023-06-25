//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    private static let initialColumns = 3
    
    @State private var isEditing: Bool = false
    @State private var isAdding: Bool = false
    
    @State private var numOfColumn: Int = initialColumns
    
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    @State private var selectedSymbol: Symbol?
    
    
    
    var stepperText: String {
        numOfColumn > 1 ? "\(numOfColumn) Columns" : "1 Column"
    }
    
    func addSymbol() {
        guard let name = selectedSymbol else { return }
        withAnimation {
            currentSymbols.insert(name, at: 0)
        }
    }
    
    @State private var currentSymbols = [
        Symbol(name: "tshirt"),
        Symbol(name: "eyes"),
        Symbol(name: "eyebrow"),
        Symbol(name: "nose"),
        Symbol(name: "mustache"),
        Symbol(name: "mouth"),
        Symbol(name: "eyeglasses"),
        Symbol(name: "facemask"),
        Symbol(name: "brain.head.profile"),
        Symbol(name: "brain"),
        Symbol(name: "icloud"),
        Symbol(name: "theatermasks.fill"),
    ]
    
    
    var body: some View {
        
        
            VStack {
                if isEditing {
                    
                    Stepper(stepperText, value: $numOfColumn, in: 1...16, step: 1) { step in
                        withAnimation {
                            gridColumns = Array(repeating: GridItem(), count: numOfColumn)
                        }
                    }
                    .frame(height: 60)
                    
                }
                ScrollView {
                    LazyVGrid(columns: gridColumns, content: {
                         
                        ForEach(currentSymbols) { symbol in
                            NavigationLink {
                                SymbolDetail(symbol: symbol)
                            } label: {
                                ZStack (alignment: .topTrailing, content: {
                                    Image(systemName: symbol.name)
                                        .resizable()
                                        .scaledToFit()
                                        .symbolRenderingMode(.hierarchical)
                                        .foregroundColor(.accentColor)
                                       
                                    
                                    if isEditing {
                                        Button {
                                            guard let index = currentSymbols.firstIndex(of: symbol) else { return }
                                            withAnimation {
                                                _ = currentSymbols.remove(at: index)
                                            }
                                        } label: {
                                            Image(systemName: "xmark.square.fill")
                                                .font(.title)
                                                .symbolRenderingMode(.palette)
                                                .foregroundStyle(.white, .red.opacity(0.6))
                                                .clipShape(Circle())
                                        }
                                    }
                                })
                                .ignoresSafeArea(.container, edges: .bottom)
                            }

                        }
                    })
                    
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, numOfColumn <= 2 ? 30 : 18)
            }
            .padding(.horizontal, 16)
            .navigationTitle("My Symbols")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isAdding, onDismiss: addSymbol, content: {
                SymbolPicker(symbol: $selectedSymbol)
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(isEditing ? "เสร็จ" : "แก้ไข") {
                        withAnimation {
                            isEditing.toggle()
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation {
                            isAdding = true
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                    .disabled(isEditing)

                }
            })
            
            
        }
        
    
}

#Preview {
    ContentView()
}
