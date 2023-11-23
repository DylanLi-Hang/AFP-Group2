//
//  QuoteViewScroll.swift
//  AFP_Group2
//
//  Created by Dylan on 23/11/2023.
//

import SwiftUI

struct QuoteViewScroll: View {
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
                                
                                Text(misconception.misconception).font(.title2)
                                    .multilineTextAlignment(.center)
                                    .frame(width: (UIScreen.main.bounds.width)*0.75)
                                    .foregroundColor(Color[misconception.backgroundTextColor])
                                    .padding(2)
 
                                 
                                
                           
                                
                                Spacer()
                            }
                            
                            
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
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
                            print("State : >> \(misconceptions[1].state)")
                        }

        }
    }
}

#Preview {
    QuoteViewScroll(misconception: misconceptions[0])
}
