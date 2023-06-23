//
//  FavoritesView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 23/6/2566 BE.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            Text("Hobbies")
                .font(.title2)
            
            HStack {
                ForEach(information.hobbies, id: \.self) { hobby in
                    Image(systemName: hobby)
                        .resizable()
                        .scaledToFit()
//                        .frame(maxWidth: 80, maxHeight: 60)
                }
                .padding()
            }
            .padding()
            
            
            Text("Food")
                .font(.title2)
            
            HStack(spacing: 60, content: {
                ForEach(information.foods, id: \.self) { food in
                    Text(food)
                        .font(.system(size: 48))
                }
            })
            .padding()
            
            Text("Favorites Colors")
                .font(.title2)
            
            HStack(spacing: 30, content: {
                ForEach(information.colors, id: \.self) { color in
                    color
                        .frame(width: 70, height: 70, alignment: .center)
                        .cornerRadius(10)
                }
            })
            .padding()
        }
    }
}

#Preview {
    FavoritesView()
}
