//
//  Person.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 22/6/2566 BE.
//

import Foundation
import SwiftData

@Model
class Person {
    var name: String
    var isLiked: Bool
    var dateAdded: Date
    
    init(name: String, isLiked: Bool = false, dateAdded: Date = .init()) {
        self.name = name
        self.isLiked = isLiked
        self.dateAdded = dateAdded
    }
}
