import SwiftUI

struct ContentView: View {
    
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
            
            QuoteView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(".profile")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
