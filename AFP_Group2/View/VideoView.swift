
import SwiftUI
import AVKit

struct VideoView: View {
    @State private var isBookmarked = false
    @State private var isArrowUpActive = false
    @State private var player = AVPlayer()
    let videoName: String = "video1"
    let videoType: String = "mov"
    let url_link:String = misconceptions[5].videoURL
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear() {
                    guard let url = URL(string: url_link) else {
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
//                HStack {
//                    Image(systemName: "chevron.backward")
//                        .resizable(resizingMode: .stretch)
//                        .frame(width: 11.0, height: 18.0)
//                        .foregroundColor(Color.white)
//                        .padding()
//                    Spacer()
//                    Text("Misconception title")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color.white)
//                        .multilineTextAlignment(.trailing)
//                        .padding()
//                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                isBookmarked.toggle()
                            }
                        Spacer()
                            .frame(height: 20)
                        ShareLink(item: url_link) {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        Spacer()
                            .frame(height: 100)
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
