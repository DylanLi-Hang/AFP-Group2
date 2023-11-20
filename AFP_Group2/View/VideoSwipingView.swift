//
//  TikTokSwipingBehavior.swift
//  AFP_Group2
//
//  Created by Dylan on 20/11/2023.
//

import SwiftUI
import AVKit

struct VideoSwipingView: View {
    let url = URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2023/10118/4/A2DA3123-3E74-4ECF-9961-EA390BE9B502/cmaf.m3u8")
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(0..<100) { i in
                    ZStack {
                        Rectangle()
                            .fill(Color.clear.opacity(0.6))
                            .containerRelativeFrame([.horizontal, .vertical])
                        Text("Video \(i+1)")
                            .font(.title)
                            .bold()
                        VideoPlayer(player: AVPlayer(url: url!))
                            .cornerRadius(0)

//                        VStack {
//                            VideoPlayer(player: player)
//                                .frame(width: 320, height: 180, alignment: .center)
//                            Button {
//                                isPlaying ? player.pause() : player.play()
//                                isPlaying.toggle()
//                                player.seek(to: .zero)
//                            } label: {
//                                Image(systemName: isPlaying ? "stop" : "play")
//                                    .padding()
//                            }
//                        }
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    VideoSwipingView()
}
