//
//  QuoteViewScroll.swift
//  AFP_Group2
//
//  Created by Dylan on 23/11/2023.
//

import SwiftUI

struct QuoteViewScroll: View {
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
