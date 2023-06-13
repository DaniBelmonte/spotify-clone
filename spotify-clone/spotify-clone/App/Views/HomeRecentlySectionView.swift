//
//  HomeRecentlySectionView.swift
//  spotify-clone
//
//  Created by Dani on 13/6/23.
//

import SwiftUI

struct HomeRecentlySectionView: View {    
    var body: some View {
        HStack(spacing: 0) {
            Image("adele")
                .resizable()
                .font(.title)
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.trailing, 4)
                .frame(alignment: .leading)
            Text("Adele")
                .fontWeight(.semibold)
                .font(.system(size: 14))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color("tabbarGray"))
    }
}
