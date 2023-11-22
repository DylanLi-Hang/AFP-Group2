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
        Text(attributedString(text: text, highlighted: highlighted, backgroundColor: .redish, foregroundColor: .white))
            
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
            .frame(width: 500, height: 1000)
            .background(.yellowish)
    }
        

}


#Preview {
    HighlightedText(text: "Hello", highlighted: "el")
}

