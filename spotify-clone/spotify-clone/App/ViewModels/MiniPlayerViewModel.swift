//
//  MiniPlayerViewModel.swift
//  spotify-clone
//
//  Created by Dani on 12/6/23.
//

import Foundation

class MiniPlayerViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var isFavorite = false
    @Published var progress: Double = 0.0
}
