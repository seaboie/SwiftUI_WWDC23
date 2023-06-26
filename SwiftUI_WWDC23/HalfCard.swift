//
//  HalfCard.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 26/6/2566 BE.
//

import SwiftUI

struct HalfCard: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "crown.fill")
                .font(.system(size: 80))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topLeading) {
            VStack {
                Image(systemName: "crown.fill")
                    .font(.body)
                Text("Q")
                    .font(.largeTitle)
                Image(systemName: "heart.fill")
                    .font(.title)
            }
            .padding()
        }
    }
}

#Preview {
    HalfCard()
}
