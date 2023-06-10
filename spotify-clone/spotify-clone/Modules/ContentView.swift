//
//  ContentView.swift
//  spotify-clone
//
//  Created by Dani on 12/3/23.
//

import SwiftUI
import UIKit

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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
