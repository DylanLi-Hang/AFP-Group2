//
//  QuoteViewScroll.swift
//  AFP_Group2
//
//  Created by Dylan on 23/11/2023.
//

import SwiftUI
import SwiftData

struct QuoteViewScroll: View {
    
    @Environment (\.modelContext) private var modelContext
    @Query private var savedMisconceptions: [MisconceptionModel]
    
    @State private var isBookmarked = false
    @State private var isArrowUpActive = false
    var misconception:MisconceptionModel
    
    var body: some View {
        VStack {
            ZStack {
                Color[misconception.backgroundColor].ignoresSafeArea()
                
                VStack {
                    ZStack{
                        VStack{
                            Spacer()
                            
                            Text(attributedString(text: misconception.quoteOrFact, highlighted: misconception.highlight, backgroundColor: UIColor[misconception.bubbleColor], foregroundColor: UIColor[misconception.highlightTextColor]))
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .frame(width: (UIScreen.main.bounds.width)*0.9)
                            
                            
                            Text(misconception.citation).font(.title2)
                                .italic()
                                .bold()
                                .foregroundColor(Color[misconception.highlightTextColor])
                                .multilineTextAlignment(.center)
                                .frame(width: (UIScreen.main.bounds.width)/2)
                                .padding(20)
                            
//                            Text(misconception.misconception).font(.title2)
//                                .multilineTextAlignment(.center)
//                                .frame(width: (UIScreen.main.bounds.width)*0.75)
//                                .foregroundColor(Color[misconception.backgroundTextColor])
//                                .padding(2)
                            
                            
                            
                            
                            
                            Spacer()
                        }
                        
                        
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Button {
                                    if misconception.quoteBookmark {
                                        modelContext.delete(misconception)
                                        misconception.quoteBookmark = false
                                    } else {
                                        modelContext.insert(misconception)
                                        misconception.quoteBookmark = true
                                    }
                                } label: {
                                    Image(systemName: misconception.quoteBookmark ? "bookmark.fill" : "bookmark")
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color.white)
                                }
                                Spacer()
                                    .frame(height: 20)
                                ShareLink(item: misconception.quoteOrFact) {
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.white)
                                    
                                    // NavigationLink to ContentView
                                }
                                Spacer()
                                    .frame(height: 100)
                                
                            }
                        }
                        .padding([.bottom, .trailing])
                    }
                }
            }
            
            .onAppear {
//                print("State : >> \(misconceptions[1].state)")
            }
            
        }
    }
}


#Preview {
    let container = try! ModelContainer(for: MisconceptionModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let context = container.mainContext
    
    let model = MisconceptionModel(misconception: "", quoteOrFact: "", highlight: "", citation: "", career: "", videoFileName: "", bubbleColor: "", backgroundColor: "", highlightColor: "", backgroundTextColor: "", highlightTextColor: "", videoURL: "", state: true)
    context.insert(model)
    try! context.save()
    
    return QuoteViewScroll(misconception: misconceptions[1])
        .modelContainer(container)
}
