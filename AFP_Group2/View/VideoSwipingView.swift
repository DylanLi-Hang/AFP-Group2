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
    
    let url = URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2023/10118/4/A2DA3123-3E74-4ECF-9961-EA390BE9B502/cmaf.m3u8")
    
    var body: some View {
        let y = print("Update body")
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                
//                ForEach(0..<100) { i in
                let misconception = misconceptions[1]
                    ZStack {
                        Rectangle()
                            .fill(Color.clear.opacity(0.6))
                            .containerRelativeFrame([.horizontal, .vertical])
                        Text("Video \(1+1)")
                            .font(.title)
                            .bold()
                        VideoPlayer(player: AVPlayer(url: url!))
                            .cornerRadius(0)
                    }
                
                ZStack {
                    Rectangle()
                        .fill(Color.clear.opacity(0.6))
                        .containerRelativeFrame([.horizontal, .vertical])
                    VStack {
                        
                        Spacer()
                        
                        Text(attributedString(text: misconception.quoteOrFact, highlighted: misconception.highlight, backgroundColor: UIColor[misconception.backgroundColor], foregroundColor: UIColor[misconception.highlightColor]))
                                .font(.title)
                                .padding(30)
                        Spacer()
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "bookmark")
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 24.0, height: 39.0)
                                    .foregroundColor(Color.white)
                                Spacer()
                                    .frame(height: 15)
                                Image(systemName: "square.and.arrow.up")
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 24.0, height: 30.52)
                                    .foregroundColor(Color.white)
                                Spacer()
                                    .frame(height: 15)
                            }
                        }
                        .padding([.bottom, .trailing])
                    }
                }
//                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: backButton,
            trailing: HStack {
                Text("Misconception Title").font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.trailing)
            }
        )
        .ignoresSafeArea()
    }
    
    private var backButton: some View {
       Button(action: {
           // Handle custom back button action
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
    func Debug() {
        print("entered videoswiping view")
    }
}

#Preview {
    VideoSwipingView()
}
