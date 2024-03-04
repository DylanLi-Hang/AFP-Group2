
import SwiftUI
import AVKit
import SwiftData

struct VideoView: View {
    
    @Environment (\.modelContext) private var modelContext
    @Query private var savedVideos: [MisconceptionModel]
    @State private var isArrowUpActive = false
    @State private var player = AVPlayer()
    @State var misconception: MisconceptionModel
    @Binding var isPlaying: Bool
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear() {
                    guard let url = URL(string: misconception.videoURL) else {
                        return
                    }
                    print(url)
                    player = AVPlayer(url: url)
                    player.play()
                }
                .onDisappear() {
                    player.pause()
                }
                .onChange(of: isPlaying) { oldValue, newValue in
                    print("new value:", newValue)
                    if newValue {
                        player.play()
                        print("video plays!")
                    } else {
                        player.pause()
                        print("video pauses!")
                    }
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
                        Button {
                            if misconception.videoBookmark {
                                modelContext.delete(misconception)
                                misconception.videoBookmark = false
                            } else {
                                modelContext.insert(misconception)
                                misconception.videoBookmark = true
                            }
                        } label: {
                            Image(systemName: misconception.videoBookmark ? "bookmark.fill" : "bookmark")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                            .frame(height: 20)
                        ShareLink(item: misconception.videoURL) {
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


#Preview {
    let container = try! ModelContainer(for: MisconceptionModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let context = container.mainContext

    let model = MisconceptionModel(misconception: "", quoteOrFact: "", highlight: "", citation: "", career: "", videoFileName: "", bubbleColor: "", backgroundColor: "", highlightColor: "", backgroundTextColor: "", highlightTextColor: "", videoURL: "", state: true)
        context.insert(model)
        try! context.save()

    return VideoView(misconception: misconceptions[1], isPlaying: .constant(false))
            .modelContainer(container)
}
