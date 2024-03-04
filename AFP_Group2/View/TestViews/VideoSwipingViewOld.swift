//
//  TikTokSwipingBehavior.swift
//  AFP_Group2
//
//  Created by Dylan on 20/11/2023.
//

import SwiftUI
import AVKit
import SwiftData

struct VideoSwipingViewOld: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isLinkActive = false
    
    
    var misconception:MisconceptionModel
    
//    let url = URL(string: "https://a.uguu.se/ybkMYwxA.mov")
    
    init(misconception:MisconceptionModel) {
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isHidden = false
        self.misconception = misconception
    }
    
    var body: some View {
        let y: () = print("Update body")
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                
                ZStack {
                    Rectangle()
                        .fill(Color.clear.opacity(0.6))
                        .containerRelativeFrame([.horizontal, .vertical])
                        .background(.yellowish)
                    QuoteViewScroll(misconception: misconception)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.clear.opacity(0.6))
                        .containerRelativeFrame([.horizontal, .vertical])
//                    VideoView(misconception: misconception)
                    
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.clear.opacity(0.6))
                        .containerRelativeFrame([.horizontal, .vertical])
                        .background(.yellowish)
                    JarView()
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
                    leading: EmptyView(),
                    trailing: EmptyView())
        .navigationBarItems(
            leading: backButton,
            trailing: HStack {
                NavigationLink(destination: ContentView(), isActive: $isLinkActive) {
                                    Text("Misconceptions")
                                        .font(.title2)
                                        .foregroundColor(Color.white)
                                        .onTapGesture {
                                            isLinkActive = true
                                        }
                                }
            }
            
        )
        .ignoresSafeArea()
    }
    
    private var backButton: some View {
       Button(action: {
           presentationMode.wrappedValue.dismiss()
       }) {
           HStack {
               Image(systemName: "chevron.backward")
                   .resizable(resizingMode: .stretch)
                   .frame(width: 11.0, height: 18.0)
                   .foregroundColor(Color.white)
           }
           .foregroundColor(.white)
       }
   }
}


extension View {
    func onBackSwipe(perform action: @escaping () -> Void) -> some View {
        gesture(
            DragGesture()
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 80 {
                        action()
                    }
                })
        )
    }
}

#Preview {
    let container = try! ModelContainer(for: MisconceptionModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let context = container.mainContext

    let model = MisconceptionModel(misconception: "", quoteOrFact: "", highlight: "", citation: "", career: "", videoFileName: "", bubbleColor: "", backgroundColor: "", highlightColor: "", backgroundTextColor: "", highlightTextColor: "", videoURL: "", state: true)
        context.insert(model)
        try! context.save()

        return SwipingView(misconception: misconceptions[1])
            .modelContainer(container)
}
