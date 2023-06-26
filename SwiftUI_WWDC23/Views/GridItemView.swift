//
//  GridItemView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 26/6/2566 BE.
//

import SwiftUI

struct GridItemView: View {
    let size: Double
    let item: Item

    var body: some View {
        ZStack(alignment: .topTrailing) {
            AsyncImage(url: item.url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: size, height: size)
        }
    }
}
//
//#Preview {
//    
//    GridItemView(size: 50, item: Item(url: Bundle.main.url(forResource: "mushy1", withExtension: "jpg")!))
//    
//}
