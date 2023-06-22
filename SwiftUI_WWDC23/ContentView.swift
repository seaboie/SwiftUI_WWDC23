//
//  ContentView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var value: CGFloat = 0;
    
    @Bindable var user:  User = .init()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                TextField("Name", text: $user.name)

            }
            .navigationTitle("Hello")
            .onChange(of: user.name, initial: true) { oldValue, newValue in
                print(oldValue, newValue)
                
            }
        }
    }
}

#Preview {
    ContentView()
}

@Observable
class User {
    var name: String = ""
    var email: String = ""
    
}
