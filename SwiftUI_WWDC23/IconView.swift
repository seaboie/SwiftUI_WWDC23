//
//  IconView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 26/6/2566 BE.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        VStack {
            Image(systemName: "crown.fill")
                .font(.headline)
            Text("Q")
                .font(.system(size: 42))
            Image(systemName: "heart.fill")
                .font(.title)
        }
        .foregroundColor(.red)
    }
}

#Preview {
    IconView()
}
