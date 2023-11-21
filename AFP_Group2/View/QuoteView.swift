//
//  QuoteView.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 20/11/2023.
//

import SwiftUI

struct QuoteView: View {

    var body: some View {
        ZStack {
            Color("redish").ignoresSafeArea()
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
                            .frame(height: 10)
                        Image(systemName: "square.and.arrow.up")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 24.0, height: 30.52)
                            .foregroundColor(Color.white)
                    }
                }
                .padding([.bottom, .trailing])
            }
        }
        .accentColor(Color.black)
    }
}
struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
