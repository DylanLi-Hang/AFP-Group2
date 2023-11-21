//
//  ContentView.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import SwiftUI

struct ContentView: View {
    init() {
        // Configure the UITabBar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white

        // Apply the appearance to all tab bar instances
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
 
    @StateObject var viewModel = QuoteViewModel() // Observe changes in QuoteViewModel

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
            
            // Pass the data to QuoteView
            if let quoteData = viewModel.quoteData {
                QuoteView(quoteData: quoteData)
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
        }
    }
}


#Preview {
    ContentView()
}
