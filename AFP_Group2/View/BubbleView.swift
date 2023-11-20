//
//  BubbleView.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//
import SwiftUI

struct BubbleView: View {
    var body: some View {
        Button("Hola") {
            // Add action here
        }
        .frame(width: 200, height: 200)
        .background(Color("purpleish"))
        .foregroundColor(Color("blackish"))
        .clipShape(Circle())
        
        
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView()
    }
}
