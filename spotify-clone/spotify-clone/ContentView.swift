//
//  ContentView.swift
//  spotify-clone
//
//  Created by Dani on 12/3/23.
//

import SwiftUI
import UIKit

struct Album {
    let name: String
    let secondaryTitle: String
}

struct ContentView: View {
    @State private var selection = 0

    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = .systemGray
        UITabBar.appearance().barTintColor = .systemGray
        UITabBar.appearance().unselectedItemTintColor = .systemGray4
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .background(Color.black.opacity(0.95))
                    .foregroundColor(.white)
                    .tag(0)

                HomeView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(1)

                HomeView()
                    .tabItem {
                        Label("Library", systemImage: "book")
                    }
                    .tag(2)
            }
            .accentColor(.white)

            VStack {
                Spacer()
                HStack {
                    Image("adele")
                        .resizable()
                        .font(.title)
                        .frame(width: 40, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .padding(.leading, 4)
                        .padding(.top, 4)
                        .padding(.bottom, 4)

                    VStack (alignment: .leading) {
                        Text("Easy On Me")
                            .font(.system(size: 14)).bold()
                            .foregroundColor(.white)
                        Text("Adele")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            // Handle like button action
                        }) {
                            Image(systemName: "heart")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        Button(action: {
                            // Handle pause button action
                        }) {
                            Image(systemName: "pause")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20, alignment: .center)
                        }

                        .padding(4)
                    }
                    .frame(width: 80, height: 40, alignment: .center)
                }
                .background(Color.brown)
                .cornerRadius(10)
                .padding(.bottom, 100)
                .padding(.horizontal, 4)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            }
        }
    }
}


struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                SectionView(title: "Your shows", data: [
                    Album(name: "Ted Talks", secondaryTitle: "Ideas worth spreading"),
                    Album(name: "Developer Podcast", secondaryTitle: "A podcast for developers"),
                    Album(name: "Ted Talks ES", secondaryTitle: "Charlas para inspirarte")
                ])
                .frame(height: 220)

                SectionView(title: "More of what you like", data: [
                    Album(name: "Relax Hits", secondaryTitle: "Chill and relax"),
                    Album(name: "Soft Pop Hits", secondaryTitle: "Soft pop tunes"),
                    Album(name: "Today's Hits", secondaryTitle: "Today's top hits"),
                    Album(name: "Happy Hits", secondaryTitle: "Feel good tunes")
                ])
                .frame(height: 220)

                SectionView(title: "Recently played", data: [
                    Album(name: "Daily Mix 1", secondaryTitle: "Mix of your favorites"),
                    Album(name: "Daily Mix 4", secondaryTitle: "More of your favorites")
                ])
                .frame(height: 220)

            }
        }
    }
}

struct SectionView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
