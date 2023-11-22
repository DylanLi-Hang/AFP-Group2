
import SwiftUI
import AVKit

struct VideoView: View {
    @State private var player = AVPlayer()
    let videoName: String = "video1"
    let videoType: String = "mov"
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear() {
                    guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2023/10118/4/A2DA3123-3E74-4ECF-9961-EA390BE9B502/cmaf.m3u8") else {
                        print("Video not in bundle")
                        return
                    }
                    print(url)
                    player = AVPlayer(url: url)
                    player.play()
                }
                .onDisappear() {
                    player.pause()
                }
            VStack {
                HStack {
                    Image(systemName: "chevron.backward")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 11.0, height: 18.0)
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                    Text("Misconception title")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding()
                }
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
        .accentColor(Color.black)
        //.navigationBarTitle("Title", displayMode: .inline) // Example
    }

}
struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
