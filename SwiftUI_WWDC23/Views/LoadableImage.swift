//
//  LoadableImage.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 26/6/2566 BE.
//

import SwiftUI

struct LoadableImage: View {
    
    var imageMetadata: Panda
    
    var body: some View {
        AsyncImage(url: imageMetadata.imageUrl) { asyncImage in
            if let image = asyncImage.image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .accessibilityHidden(false)
                    .accessibilityLabel(Text(imageMetadata.description))
            } else if asyncImage.error != nil {
                VStack(content: {
                    Image("pandaplaceholder")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 300)
                    Text("The pandas were all busy.")
                        .font(.title2)
                    Text("Please try again")
                        .font(.title3)
                })
            } else {
                ProgressView()
            }
        }

    }
}

#Preview {
    LoadableImage(imageMetadata: Panda.defaultPanda)
}
