//
//  BubblesMoving.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 17/11/2023.
//

import SwiftUI

struct ContentView2: View {
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0

    var body: some View {
        VStack {
            Spacer()

            Circle()
                .frame(width: 70, height: 70)
                .foregroundColor(.purple)
                .offset(x: offsetX, y: offsetY)
                .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))
                .onAppear {
                    // Set the initial position
                    self.offsetX = 100
                    self.offsetY = 200
                }

            Spacer()
            
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .offset(x: offsetX, y: offsetY)
                .animation(Animation.easeOut(duration: 4).repeatForever(autoreverses: true))
                .onAppear {
                    // Set the initial position
                    self.offsetX = 200
                    self.offsetY = 100
                }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
