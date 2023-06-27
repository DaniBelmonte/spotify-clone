//
//  SearchView.swift
//  spotify-clone
//
//  Created by Dani on 22/6/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            Text(searchText)
        }
        .searchable(text: $searchText, placement: .sidebar)
        .background(.black)
    }
}
