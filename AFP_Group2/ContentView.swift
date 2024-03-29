import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment (\.modelContext) private var modelContext
    @Query private var misconceptions: [MisconceptionModel]
    
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
            
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
            
            // Pass the data to QuoteView
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
//                .tag(".profile")
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ContentView().modelContainer(for: MisconceptionModel.self, inMemory: true)
}
