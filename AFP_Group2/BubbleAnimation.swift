//
//  BubbleAnimation.swift
//  AFP_Group2
//
//  Created by Fabian Roth on 17/11/2023.
//

import Foundation

import SwiftUI

struct BubbleAnimation: View {
    @State private var buttonData: [(color: Color, initialX: CGFloat, initialY: CGFloat, directionX: CGFloat, directionY: CGFloat, buttonColor: ButtonColor)] = [
        (.purple, CGFloat.random(in: -200..<200), CGFloat.random(in: -200..<200), CGFloat.random(in: -1...1), CGFloat.random(in: -1...1), .purple),
        (.yellow, CGFloat.random(in: -200..<200), CGFloat.random(in: -200..<200), CGFloat.random(in: -1...1), CGFloat.random(in: -1...1), .yellow),
        (.blue, CGFloat.random(in: -200..<200), CGFloat.random(in: -200..<200), CGFloat.random(in: -1...1), CGFloat.random(in: -1...1), .blue),
        (.green, CGFloat.random(in: -200..<200), CGFloat.random(in: -200..<200), CGFloat.random(in: -1...1), CGFloat.random(in: -1...1), .green)
    ]

    @State private var selectedButton: ButtonColor? = nil

    var body: some View {
        VStack {
            Spacer()

            ForEach(buttonData, id: \.buttonColor) { button in
                if self.shouldShowButton(button.buttonColor) {
                    CircleView(
                        initialColor: button.color,
                        initialX: button.initialX,
                        initialY: button.initialY,
                        isSelected: self.selectedButton == button.buttonColor
                    )
                    .onTapGesture {
                        self.handleButtonTap(button: button.buttonColor)
                    }
                    .animation(self.selectedButton == nil ? Animation.linear(duration: 2.0).repeatForever(autoreverses: true): nil)
                    Spacer()
                }
            }
        }
        .onAppear {
            // Start the continuous animation when the view appears
            withAnimation {
                self.startBubblesAnimation()
            }
        }
    }

    private func handleButtonTap(button: ButtonColor) {
        // Action to perform when a button is tapped
        print("\(button) button tapped")

        // Update the selected button without modifying buttonData
        withAnimation(.easeInOut(duration: 1.0)) {
            selectedButton = button
        }

        // Start the deletion animation immediately
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                // Fade out
                buttonData = buttonData.map { data in
                    var updatedData = data
                    if data.buttonColor != selectedButton {
                        updatedData.color = .clear
                    }
                    return updatedData
                }
            }
        }

        // Move to the center
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                buttonData = buttonData.map { data in
                    var updatedData = data
                    if data.buttonColor == selectedButton {
                        updatedData.initialX = 0
                        updatedData.initialY = 0
                    }
                    return updatedData
                }
            }
        }

        // Expand
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                buttonData = buttonData.map { data in
                    var updatedData = data
                    if data.buttonColor == selectedButton {
                        updatedData.initialX = 0
                        updatedData.initialY = 0
                        updatedData.color = data.color
                    }
                    return updatedData
                }
            }

            // Reset selectedButton after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
                withAnimation {
                    selectedButton = nil
                    self.startBubblesAnimation()
                }
            }
        }
    }

    private func startBubblesAnimation() {
        buttonData.indices.forEach { index in
            buttonData[index].directionX = CGFloat.random(in: -1...1)
            buttonData[index].directionY = CGFloat.random(in: -1...1)
        }
    }

    private func shouldShowButton(_ button: ButtonColor) -> Bool {
        return self.getButtonVisibility(button)
    }

    private func getButtonVisibility(_ button: ButtonColor) -> Bool {
        return buttonData.first { $0.buttonColor == button } != nil
    }
}

// Enum to represent button colors
enum ButtonColor {
    case purple, yellow, blue, green
}

struct CircleView: View {
    var initialColor: Color
    var initialX: CGFloat
    var initialY: CGFloat
    var isSelected: Bool

    var body: some View {
        Circle()
            .frame(width: isSelected ? 400 : 200, height: isSelected ? 400 : 200) // Adjust the size as needed
            .foregroundColor(initialColor)
            .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
            .offset(x: isSelected ? 0 : initialX, y: isSelected ? 0 : initialY)
    }
}

struct BubbleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BubbleAnimation()
    }
}











