//
//  SwiftUI_WWDC23App.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_WWDC23App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                
        }
        .modelContainer(for: Person.self)
        
    }
}
