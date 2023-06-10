//
//  HomeViewModel.swift
//  spotify-clone
//
//  Created by Dani on 10/6/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var sections: [AlbumSection] = [
        AlbumSection(title: "Your shows", albums: [
            Album(name: "Ted Talks", secondaryTitle: "Ideas worth spreading"),
            Album(name: "Developer Podcast", secondaryTitle: "A podcast for developers"),
            Album(name: "Ted Talks ES", secondaryTitle: "Charlas para inspirarte")
        ]),
        AlbumSection(title: "More of what you like", albums: [
            Album(name: "Relax Hits", secondaryTitle: "Chill and relax"),
            Album(name: "Soft Pop Hits", secondaryTitle: "Soft pop tunes"),
            Album(name: "Today's Hits", secondaryTitle: "Today's top hits"),
            Album(name: "Happy Hits", secondaryTitle: "Feel good tunes")
        ]),
        AlbumSection(title: "Recently played", albums: [
            Album(name: "Daily Mix 1", secondaryTitle: "Mix of your favorites"),
            Album(name: "Daily Mix 4", secondaryTitle: "More of your favorites")
        ])
    ]
}
