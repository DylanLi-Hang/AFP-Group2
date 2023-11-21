//
//  BottleView.swift
//  AFP_Group2
//
//  Created by Dylan on 19/11/2023.
//

import SwiftUI
import UIKit

struct BottleView: View {
    var isHighlighted: Bool
    var starNumber : Int = 0
    
    
    var body: some View {
        ZStack {
            Image("JarGlass")
                .resizable()
                .frame(minWidth: 50, maxWidth: 200, minHeight: 50, maxHeight: 240)
                .scaledToFit()
                .fixedSize()
                .border(isHighlighted ? Color.green : Color.clear, width: 5)
                .opacity(0.5)
        }
        .frame(width: 120, height: 200)
        
    }
}
#Preview {
    BottleView(isHighlighted: false)
}
