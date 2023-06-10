//
//  Album.swift
//  spotify-clone
//
//  Created by Dani on 10/6/23.
//

import Foundation

struct Album: Identifiable {
    var id = UUID()
    let name: String
    let secondaryTitle: String
}
