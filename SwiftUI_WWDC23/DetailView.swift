//
//  DetailView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 21/6/2566 BE.
//

import SwiftUI

struct DetailView: View {
    @Query(FetchDescriptor(predicate: #Predicate {$0.isLiked == true}, sortBy: [SortDescriptor(\.dateAdded, order: .reverse)]
    ), animation: .snappy) private var favorites: [Person];
    var body: some View {
        Text(favorites[0].name =)
    }
}

#Preview {
    DetailView(favorites: [])
}
