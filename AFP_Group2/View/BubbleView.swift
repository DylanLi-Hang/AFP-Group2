//
//  BubbleView.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import SwiftUI

struct BubbleView: View {
    var size : Int = 10
    var color : Color = Color.red
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundStyle(color)
    }
}

#Preview {
    BubbleView()
}
