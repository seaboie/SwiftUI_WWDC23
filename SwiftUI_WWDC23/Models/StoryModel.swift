//
//  StoryModel.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 24/6/2566 BE.
//

import Foundation

struct StoryPage {
    let text: String
    let choices: [Choice]
    
    init(text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
}

struct Choice {
    let text: String
    let destination: Int
}
