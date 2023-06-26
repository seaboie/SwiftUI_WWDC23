//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    private static let initialColumns = 3
    
     @State private var isAddingPhoto: Bool = false
     @State private var isEditing: Bool = false
    
     @State private var numColumns: Int = initialColumns
    @State private var gridColumn: [GridItem] = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    private var columnsTitle: String {
        gridColumn.count > 1 ? "\(gridColumn.count) Columns" : "1 Column"
    }
    
    
    var body: some View {
        VStack {
            if isEditing {
                ColumnStepper(title: columnsTitle, range: 1...8, columns: $gridColumn)
                    .padding()
            }
            ScrollView {
                LazyVGrid(columns: gridColumn, content: {
                    
                    ForEach(dataModel.items) { item in
                        GeometryReader { geo in
                            NavigationLink {
                                DetailView(item: item)
                            } label: {
                                GridItemView(size: geo.size.width, item: item)
                            }
                        }
                        .cornerRadius(8)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(alignment: .topTrailing) {
                            if isEditing {
                                Button(action: {
                                    withAnimation {
                                        dataModel.removeItem(item)
                                    }
                                }, label: {
                                    Image(systemName: "xmark.square.fill")
                                        .font(.title)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, .red)
                                })
                                .zIndex(1000)
                                .offset(x: -4, y: 4)
                            }
                        }
                    }
                })
            }
            .padding()
        }
        .navigationTitle("Image Gallery")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingPhoto, content: {
            PhotoPicker()
                .ignoresSafeArea(.container, edges: .bottom)
        })
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    isAddingPhoto = true
                }, label: {
                    Image(systemName: "plus")
                })
                .disabled(isEditing)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataModel())
            
    }
}
