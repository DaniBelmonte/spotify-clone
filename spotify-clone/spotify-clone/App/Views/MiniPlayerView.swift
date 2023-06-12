//
//  MiniPlayerView.swift
//  spotify-clone
//
//  Created by Dani on 12/6/23.
//

import SwiftUI

struct MiniPlayerView: View {
    @StateObject private var viewModel = MiniPlayerViewModel()
    @State private var backgroundColor: Color = .clear

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 0) {
                HStack {
                    Image("adele")
                        .resizable()
                        .font(.title)
                        .frame(width: 40, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .padding(.leading, 4)
                        .padding(.vertical, 4)

                    VStack(alignment: .leading) {
                        Text("Easy On Me")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.white)
                        Text("Adele")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            viewModel.isFavorite.toggle()
                        }) {
                            Image(systemName: viewModel.isFavorite ? "heart" : "heart.fill")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        Button(action: {
                            viewModel.isPlaying.toggle()
                        }) {
                            Image(systemName: viewModel.isPlaying ? "pause" : "play.fill")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .padding(4)
                    }
                    .frame(width: 80, height: 40, alignment: .center)
                }
                ProgressView(value: 0.2)
                    .padding(0)
                    .tint(.white)
                    .frame(height: 1)
            }
            .background(backgroundColor)
            .cornerRadius(10)
            .padding(.bottom, 110)
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
        } .onAppear {
            setAverageColor()
        }
    }

    private func setAverageColor() {
        if let image = UIImage(named: "adele") {
            var averageColor = Color(uiColor: image.averageColor ?? .clear)
            backgroundColor = averageColor
        }
    }
}
