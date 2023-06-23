//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var ctx
    @Query(FetchDescriptor(predicate: #Predicate {$0.isLiked == true}, sortBy: [SortDescriptor(\.dateAdded, order: .reverse)])) private var favorites: [Person]
    @Query(FetchDescriptor(predicate: #Predicate {$0.isLiked == false}, sortBy: [SortDescriptor(\.dateAdded, order: .reverse)])) private var normal: [Person]
    
    var body: some View {
        NavigationStack {
            List {
                
                DisclosureGroup("Favorites") {
                    ForEach(favorites) { person in
                        HStack {
                            Text(person.name)
                            Spacer()
                            Button(action: {
                                person.isLiked.toggle()
                                try? ctx.save()
                            }, label: {
                                Image(systemName: "suit.heart.fill")
                                    .foregroundColor(.red)
                            })
                            
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button{
                                ctx.delete(person)
                                try? ctx.save()
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
                DisclosureGroup("Normal") {
                    ForEach(normal) { person in
                        HStack {
                            Text(person.name)
                            Spacer()
                            Button(action: {
                                person.isLiked.toggle()
                                try? ctx.save()
                            }, label: {
                                Image(systemName: "suit.heart.fill")
                                    .foregroundStyle(.gray)
                            })
                            
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                ctx.delete(person)
                                try? ctx.save()
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
                
            }
            .navigationTitle("Swift Data")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Item") {
                        let person = Person(name: "Date is : \(Date().formatted(date: .omitted, time: .shortened))")
                        
                        do {
                            ctx.insert(person)
                            try ctx.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }

                }
            })
        }
    }
}

#Preview {
    ContentView()
}

