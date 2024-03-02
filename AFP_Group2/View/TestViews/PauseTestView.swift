//
//  PauseTestView.swift
//  AFP_Group2
//
//  Created by Dylan on 2/3/2024.
//
import SwiftUI
import AVFoundation
import AVKit

// Parent View
struct PauseTestView: View {
    @State private var isPlaying = false
    let player = AVPlayer() // Ideally, you'd configure this with your media

    var body: some View {
        VStack {
            PlayerView(player: player, isPlaying: $isPlaying)
            ControlView(isPlaying: $isPlaying)
        }
    }
}

// Child View 1 - Player View
struct PlayerView: View {
    let player: AVPlayer
    @Binding var isPlaying: Bool

    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player.play() // Start playing when the view appears
            }
            .onChange(of: isPlaying) { newValue in
                if newValue {
                    player.play()
                } else {
                    player.pause()
                }
            }
    }
}

// Child View 2 - Control View
struct ControlView: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(action: {
            isPlaying.toggle()
        }) {
            Text(isPlaying ? "Pause" : "Play")
        }
    }
}


#Preview {
    PauseTestView()
}
