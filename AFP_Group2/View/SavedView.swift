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
    
    let images: [String] = ["Video1Image", "Video2Image", "Video3Image", "Quote1Image", "Quote2Image", "Quote3Image", "Video4Image", "Video5Image", "Video6Image"]
    
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
//                Button("Debug") {
//                    print(savedConceptions)
//                    savedConceptions.forEach { misconception in
//                        print("yes")
//                    }
//                    for misconception in savedConceptions {
//                        print(misconception.videoFileName)
//                        if (misconception.quoteBookmark) {
//                            print("yes")
//                        }
//                    }
//                }
                LazyVGrid(columns: columns, spacing: 12) {
                    
                    // Dummy data
                    ForEach(images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .cornerRadius(8)
                    }
                    
                    ForEach(savedConceptions, id: \.self) { misconception in
                        if (misconception.quoteBookmark) {
                            NavigationLink {
                                SwipingView(misconception: misconception)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8.0).fill(Color(misconception.bubbleColor))
//                                    Text(misconception.quoteOrFact)
//                                        .foregroundStyle(.black)
//                                        .font(.caption)
//                                        .padding()
                                    Text(attributedString(text: misconception.quoteOrFact, highlighted: misconception.highlight, backgroundColor: UIColor[misconception.bubbleColor], foregroundColor: UIColor[misconception.highlightTextColor]))
                                        .foregroundStyle(.black)
                                        .font(.caption2)
                                        .padding(8)
                                }.frame(width: 110, height: 175)
                            }
                        }
                        if (misconception.videoBookmark) {
                            
                            NavigationLink {
                                SwipingView(misconception: misconception)
                            } label: {
                                ZStack {
                                    var img_name = misconception.videoFileName.replacingOccurrences(of: "video", with: "Video") + "Image"
//                                    Button("Debug") {
//                                        print(img_name)
//                                    }
                                    Image(img_name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .cornerRadius(8)
//                                        .background(.red)
                                    Image(systemName: "play.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white, .redishDark)
                                        .frame(width: 25, height: 25)
                                        .padding(.top, 10)
                                        .padding(.trailing, 5)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                    
                                }.frame(width: 110, height: 175)
                            }
                        }
                    }
                    
                    /*ForEach(savedConceptions, id: \.self) { misconception in
                        if (misconception.videoBookmark) {
                            
                            NavigationLink {
                                VideoSwipingView(misconception: misconception)
                            } label: {
                                ZStack {
                                    var img_name = misconception.videoFileName.replacingOccurrences(of: "video", with: "Video") + "Image"
//                                    Button("Debug") {
//                                        print(img_name)
//                                    }
                                    Image(img_name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .cornerRadius(8)
//                                        .background(.red)
                                    Image(systemName: "play.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white, .redishDark)
                                        .frame(width: 25, height: 25)
                                        .padding(.top, 10)
                                        .padding(.trailing, 5)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                    
                                }.frame(width: 110, height: 175)
                            }
                        }
                    } */
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

//struct SavedView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        SavedView().modelContainer(for: MisconceptionModel.self, inMemory: true)
//        
//        
////        let container = try! ModelContainer(for: MisconceptionModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
////        let context = container.mainContext
////        
////        let model = MisconceptionModel(misconception: "", quoteOrFact: "", highlight: "", citation: "", career: "", videoFileName: "", bubbleColor: "", backgroundColor: "", highlightColor: "", backgroundTextColor: "", highlightTextColor: "", videoURL: "", state: true)
////        context.insert(model)
////        try! context.save()
////        
////        return SavedView()
////            .modelContainer(container)
////    }
//}

#Preview {
    ContentView().modelContainer(for: MisconceptionModel.self, inMemory: true)
}
