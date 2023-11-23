//
//  TikTokSwipingBehavior.swift
//  AFP_Group2
//
//  Created by Dylan on 20/11/2023.
//

import SwiftUI
import AVKit

struct VideoSwipingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isLinkActive = false
    
    let url = URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2023/10118/4/A2DA3123-3E74-4ECF-9961-EA390BE9B502/cmaf.m3u8")
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isHidden = false
    }
    
    var body: some View {
        let y = print("Update body")
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                
                ZStack {
                    Rectangle()
                        .fill(Color.clear.opacity(0.6))
                        .containerRelativeFrame([.horizontal, .vertical])
                    VideoView()
                    
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.clear.opacity(0.6))
                        .containerRelativeFrame([.horizontal, .vertical])
                        .background(.yellowish)
                    QuoteViewScroll()
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

#Preview {
    VideoSwipingView()
}
