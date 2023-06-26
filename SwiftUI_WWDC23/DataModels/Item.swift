//
//  Item.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 25/6/2566 BE.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let url: URL
}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}
