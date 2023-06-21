//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var ctx;
    @Query(FetchDescriptor(predicate: #Predicate {$0.isLiked == true}, sortBy: [SortDescriptor(\.dateAdded, order: .reverse)]
    ), animation: .snappy) private var favorites: [Person];
    @Query(FetchDescriptor(predicate: #Predicate {$0.isLiked == false}, sortBy: [SortDescriptor(\.dateAdded, order: .reverse)]
                          ), animation: .interpolatingSpring()) private var normal: [Person];

    
    var body: some View {
        NavigationStack {
            List {
                DisclosureGroup("Favorites") {
                    ForEach(favorites) { person in
                        HStack {
                            Text(person.name)
                            Spacer()
                            Button {
                                person.isLiked.toggle();
                                try? ctx.save()
                            } label: {
                                Image(systemName: "heart.fill")
                                    .tint(.red)
                            }

                        }
                        .swipeActions {
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
                DisclosureGroup("Normal") {
                    ForEach(normal) { person in
                        HStack {
                            Text(person.name)
                            Spacer()
                            
                            
                            Button {
                                person.isLiked.toggle();
                                try? ctx.save()
                            } label: {
                                Image(systemName: "heart")
                                    .tint(.gray)
                            }

                        }
                        .swipeActions {
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
                    Button("Add item") {
                        
                        
                        let person = Person(name: "Hello user \(Date().formatted(date: Date.FormatStyle.DateStyle.omitted, time: Date.FormatStyle.TimeStyle.standard))")
                        
                        ctx.insert(person)
                        do {
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

@Model
class Person {
    var name: String;
    var isLiked: Bool;
    var dateAdded: Date;
    
    init(name: String, isLiked: Bool = false, dateAdded: Date = Date.now) {
        self.name = name
        self.isLiked = isLiked
        self.dateAdded = dateAdded
    }
 }
