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
    
    let url = URL(string: "https://a.uguu.se/ybkMYwxA.mov")
    
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
                Text("Men are better than women in sciences").font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.trailing)
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
