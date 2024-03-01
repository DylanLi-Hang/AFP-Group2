//
//  SavedView.swift
//  AFP_Group2
//
//  Created by Jamie Chao on 23/11/2023.
//

import SwiftUI
import SwiftData

struct SavedView: View {
    
    @Environment (\.modelContext) private var modelContext
    @Query private var savedConceptions: [MisconceptionModel]
    
    let images: [String] = ["VideoImage1", "VideoImage2", "VideoImage3", "Quote1", "Quote2", "Quote3", "VideoImage4", "VideoImage5", "VideoImage6"]

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    init() {
            // Customize navigation bar title appearance
            UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor.blue]
        }
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(savedConceptions, id: \.self) { misconception in
                        NavigationLink {
                            VideoSwipingView(misconception: misconception)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15.0).fill(Color(misconception.bubbleColor))
                                Text(misconception.quoteOrFact)
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .padding()
                            }.frame(width: 110, height: 175)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Saved content", displayMode: .large)
            .navigationBarColor(backgroundColor: .white, titleColor: .blackish)
        }
    }
}

// Extension to change navigation bar color and title color
extension View {
    func navigationBarColor(backgroundColor: UIColor, titleColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    
    var backgroundColor: UIColor
    var titleColor: UIColor
    
    init(backgroundColor: UIColor, titleColor: UIColor) {
        self.backgroundColor = backgroundColor 
        // Initialize the stored property
        self.titleColor = titleColor 
        // Initialize the stored property
        

        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    func body(content: Content) -> some View {
        content
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView().modelContainer(for: MisconceptionModel.self, inMemory: true)
    }
}

