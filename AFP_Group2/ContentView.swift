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
        TabView() {
            NavigationView {
                BubbleMisconceptionView(stateManager: StateManager())
            }
            .tabItem {
                Label("Home", systemImage: "circle.hexagongrid.fill")
            }
            
            CollectStarView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
            
            // Pass the data to QuoteView
            
            GuidanceView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(".profile")
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ContentView()
}
