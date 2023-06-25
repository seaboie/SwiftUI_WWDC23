//
//  SymbolDetail.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 24/6/2566 BE.
//

import SwiftUI

struct SymbolDetail: View {
    
    var symbol: Symbol
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.white)
            Rectangle()
                .fill(.white)
                .overlay {
                    Text(symbol.name)
                        .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                }
            Rectangle()
                .fill(.white)
                .overlay {
                    Image(systemName: symbol.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    //                .scaledToFit()
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.accentColor)
                }
                
            Rectangle()
                .fill(.white)
                
        }
        .padding()
    }
}

#Preview {
    SymbolDetail(symbol: Symbol(name: "magnifyingglass"))
}
