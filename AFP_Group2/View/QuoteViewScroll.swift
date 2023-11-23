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
    
    var body: some View {
        VStack {
            
            ZStack {
                Color("yellowish").ignoresSafeArea()
                VStack {
                    let misconception = misconceptions[1]
                    Spacer()
                    Text(misconception.misconception).font(.title)
                        .multilineTextAlignment(.center)
                        .frame(width: (UIScreen.main.bounds.width)/2)
                        .bold()
      
                         
                    Spacer()
                   
                    Text(attributedString(text: misconception.quoteOrFact, highlighted: misconception.highlight, backgroundColor: .redish, foregroundColor: .white))
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .frame(width: (UIScreen.main.bounds.width)*0.8)
                    
                    Spacer()
                    
                    Text(misconception.citation).font(.title2)
                        .multilineTextAlignment(.center)
                        .frame(width: (UIScreen.main.bounds.width)/2)
                 

                    
                    
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
                            ShareLink(item: misconception.quoteOrFact) {
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
        }
    }
}

#Preview {
    QuoteViewScroll()
}
