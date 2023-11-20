//
//  ContentView.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TapView()
                .tabItem {
                    Label("Home", systemImage: "circle.hexagongrid.fill")
                }
            
            CollectStarView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
            
            QuoteView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
