//
//  HomeView.swift
//  spotify-clone
//
//  Created by Dani on 10/6/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(viewModel.sections) { section in
                    HomeSectionView(title: section.title, data: section.albums)
                        .frame(height: 220)
                }
            }
        }
    }
}
