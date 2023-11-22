//
//  HighlightTestView.swift
//  AFP_Group2
//
//  Created by Dylan on 21/11/2023.
//

import SwiftUI

private struct HighlightedText: View {
    var text: String
    var highlighted: String

    var body: some View {
        Text(attributedString(text: text, highlighted: highlighted, backgroundColor: .yellow, foregroundColor: .red))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
    }

}

private func attributedString(text: String, highlighted: String, backgroundColor: UIColor, foregroundColor: UIColor) -> AttributedString {
    var attributedString = AttributedString(text)

    if let range = attributedString.range(of: highlighted) {
        attributedString[range].backgroundColor = backgroundColor
        attributedString[range].foregroundColor = foregroundColor
    }
    return attributedString
}

#Preview {
    HighlightedText(text: "Hello", highlighted: "el")
}

