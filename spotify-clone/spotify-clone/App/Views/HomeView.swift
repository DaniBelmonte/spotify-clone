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
            HStack() {
                Text("Good Morning")
                    .padding(4)
                    .font(.system(.title))
                Spacer()
            }
            HStack(spacing: 0) {
                VStack(spacing: 4) {
                    ForEach(0...2, id: \.self) {_ in
                        HomeRecentlySectionView()
                    }
                    .cornerRadius(4)
                }
                .background(.black)
                .padding(4)
                .frame(width: UIScreen.main.bounds.width / 2)

                VStack(spacing: 4) {
                    ForEach(0...2, id: \.self) {_ in
                        HomeRecentlySectionView()
                    }
                    .cornerRadius(4)
                    .frame(alignment: .leading)
                }
                .background(.black)
                .padding(4)
                .frame(width: UIScreen.main.bounds.width / 2)
            }

            VStack {
                ForEach(viewModel.sections) { section in
                    HomeSectionView(title: section.title, data: section.albums)
                        .frame(height: 220)
                }
            }
            Spacer()
                .padding(40)
        }
    }
}
