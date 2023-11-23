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
                Color("redish").ignoresSafeArea()
                VStack {
                    Spacer()
                    let misconception = misconceptions[1]
                    Text(attributedString(text: misconception.quoteOrFact, highlighted: misconception.highlight, backgroundColor: UIColor[misconception.backgroundColor], foregroundColor: UIColor[misconception.highlightColor]))
                            .font(.title)
                            .padding(30)
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
            
            /*Text(attributedString(text: misconception.quoteOrFact, highlighted: misconception.highlight, backgroundColor: UIColor[misconception.backgroundColor], foregroundColor: UIColor[misconception.highlightColor]))
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
            .padding([.bottom, .trailing])*/
//                        QuoteView()
        }
    }
}

#Preview {
    QuoteViewScroll()
}
