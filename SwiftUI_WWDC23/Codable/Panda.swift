//
//  Panda.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 26/6/2566 BE.
//

import Foundation

struct Panda: Codable {
    var description: String
    var imageUrl: URL?
    
    static let defaultPanda = Panda(description: "Cute Panda", imageUrl: URL(string: "https://assets.devpubs.apple.com/playgrounds/_assets/pandas/pandaBuggingOut.jpg"))
}
