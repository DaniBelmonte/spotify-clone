//
//  ContentView.swift
//  spotify-clone
//
//  Created by Dani on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColor(named: "tabbarGray")
        UITabBar.appearance().barTintColor = UIColor(named: "tabbarGray")
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

                SearchView()
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

            MiniPlayerView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
