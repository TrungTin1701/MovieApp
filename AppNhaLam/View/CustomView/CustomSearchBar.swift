//
//  CustomSearchBar.swift
//  AppNhaLam
//
//  Created by Tin/Perry/ServiceDev on 23/7/24.
//

import SwiftUI

struct CustomSearchBar: View {
    @State var currentText: String = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search Movie", text: $currentText)
            Image(systemName: "mic.fill")
        }
        .padding(EdgeInsets(top: 7, leading: 8, bottom: 7, trailing: 8))
        .font(.headline)
        .background(.ultraThinMaterial)
        .foregroundColor(.white.opacity(0.6))
        .cornerRadius(10)

    }
}

#Preview {
    CustomSearchBar()
}
