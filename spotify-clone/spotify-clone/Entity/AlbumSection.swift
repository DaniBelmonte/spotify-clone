//
//  AlbumSection.swift
//  spotify-clone
//
//  Created by Dani on 10/6/23.
//

import Foundation

struct AlbumSection: Identifiable {
    let id = UUID()
    let title: String
    let albums: [Album]
}
