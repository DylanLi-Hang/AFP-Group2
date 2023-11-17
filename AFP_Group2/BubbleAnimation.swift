//
//  BubbleAnimation.swift
//  AFP_Group2
//
//  Created by Fabian Roth on 17/11/2023.
//

import Foundation

import SwiftUI

struct BubbleAnimation: View {
    var body: some View {
        VStack {
            Spacer()

            Button(action: {
                // Action to perform when the button is tapped
                print("Purple button tapped")
            }) {
                CircleView(color: .purple, duration: 9, initialX: -50, initialY: -50)
            }

            Spacer()

            Button(action: {
                // Action to perform when the button is tapped
                print("Yellow button tapped")
            }) {
                CircleView(color: .yellow, duration: 9, initialX: -100, initialY: -100)
            }

            Spacer()

            Button(action: {
                // Action to perform when the button is tapped
                print("Blue button tapped")
            }) {
                CircleView(color: .blue, duration: 7, initialX: 200, initialY: 100)
            }

            Spacer()

            Button(action: {
                // Action to perform when the button is tapped
                print("Green button tapped")
            }) {
                CircleView(color: .green, duration: 7, initialX: 100, initialY: 150)
            }

            Spacer()

            Button(action: {
                // Action to perform when the button is tapped
                print("Green button tapped")
            }) {
                CircleView(color: .green, duration: 7, initialX: 100, initialY: 150)
            }

            Spacer()
        }
    }
}

struct CircleView: View {
    var color: Color
    var duration: Double
    var initialX: CGFloat
    var initialY: CGFloat

    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0

    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .foregroundColor(color)
            .offset(x: offsetX, y: offsetY)
            .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true))
            .onAppear {
                // Set the initial position
                self.offsetX = initialX
                self.offsetY = initialY
            }
    }
}

struct BubbleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BubbleAnimation()
    }
}
