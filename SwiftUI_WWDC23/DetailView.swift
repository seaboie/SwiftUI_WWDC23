//
//  DetailView.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 22/6/2566 BE.
//

import SwiftUI

struct DetailView: View {
    @Bindable var user: User = .init();
    
    var body: some View {
        VStack {
            Text("Detail view")
            Text(user.name)
        }
    }
}

#Preview {
    DetailView()
}
