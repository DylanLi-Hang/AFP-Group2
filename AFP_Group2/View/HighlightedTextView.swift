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
        Text(attributedString(text: text, highlighted: highlighted))
    }

}

public func attributedString(text: String, highlighted: String) -> AttributedString {
    var attributedString = AttributedString(text)

    if let range = attributedString.range(of: highlighted) {
        attributedString[range].backgroundColor = .yellow
        attributedString[range].foregroundColor = .blue
    }
    return attributedString
}

#Preview {
    HighlightedText(text: "Hello", highlighted: "el")
}

