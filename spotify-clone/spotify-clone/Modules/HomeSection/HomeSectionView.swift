//
//  HomeSection.swift
//  spotify-clone
//
//  Created by Dani on 10/6/23.
//

import SwiftUI

struct HomeSectionView: View {
    let title: String
    let data: [Album]

    let gridLayout = [
        GridItem(.adaptive(minimum: 100))
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 20)).bold()
                .padding(.leading)
                .padding(.bottom, 4)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayout, spacing: 10) {
                    ForEach(data, id: \.name) { item in
                        VStack(alignment: .leading) {
                            Color.green
                                .frame(height: 130)
                                .cornerRadius(10)
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.system(size: 14))
                                Text(item.secondaryTitle)
                                    .font(.system(size: 12))
                            }
                            .frame(width: 120, height: 30, alignment: .leading)
                        }
                        .frame(width: 130, alignment: .leading)

                    }
                }
                .padding(.leading)
                .fixedSize()
            }

        }
    }
}
