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
                Text(attributedString(text: "text", highlighted: "tex", backgroundColor: .yellow, foregroundColor: .red))
                        .font(.title)
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
    }
    private func attributedString(text: String, highlighted: String, backgroundColor: UIColor, foregroundColor: UIColor) -> AttributedString {
        var attributedString = AttributedString(text)

        if let range = attributedString.range(of: highlighted) {
            attributedString[range].backgroundColor = backgroundColor
            attributedString[range].foregroundColor = foregroundColor
        }
        return attributedString
    }
}
struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide sample data for previews
        QuoteView()
    }
}

