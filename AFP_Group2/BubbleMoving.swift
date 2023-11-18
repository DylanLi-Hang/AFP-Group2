//
//  BubblesMoving.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 17/11/2023.
//

import SwiftUI

struct ContentView2: View {
    @State private var animatedCircles: [AnimatedCircle] = []
    @State private var circles: [CircleParameters] = [
        CircleParameters(width: 200, height: 200, color: .purple, duration: 3, xOffset: 100, yOffset: 200, isClicked: false, visible: true),
        CircleParameters(width: 200, height: 200, color: .blue, duration: 4, xOffset: -100, yOffset: 150, isClicked: false, visible: true),
        CircleParameters(width: 200, height: 200, color: .yellow, duration: 4, xOffset: 50, yOffset: 50, isClicked: false, visible: true)
    ]

    var body: some View {
        VStack {
            Spacer()

            ForEach(circles.indices, id: \.self) { index in
                AnimatedCircle(parameters: $circles[index], color: $circles[index].color)
                    .onAppear {
                        animatedCircles.append(AnimatedCircle(parameters: $circles[index], color: $circles[index].color))
                    }
                    .onTapGesture {
                        // Handle tap here
                        print(index)
                        // Toggle visibility of the tapped circle and make others invisible
                        circles.indices.forEach { circles[$0].visible = $0 == index }
                        expandClickedCircle(for: index)
                    }
                    .opacity(circles[index].visible ? 1 : 0)
            }

            Spacer()

            // Button to trigger an action on the AnimatedCircles
            Button("Do Something") {
                // Example: Make the first circle disappear
                print(circles)
                animatedCircles.first?.hide()
            }
        }
    }
    
    func expandClickedCircle(for tappedIndex: Int) {
            circles.indices.forEach { index in
                if index == tappedIndex {
                    // Expand the clicked circle by 50%
                    circles[index].width *= 10
                    circles[index].height *= 10
                    circles[index].xOffset = 0
                    circles[index].yOffset = 0
                }
            }
        }
}

struct AnimatedCircle: View {
    @Binding var parameters: CircleParameters
    @Binding var color: Color
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0

    init(parameters: Binding<CircleParameters>, color: Binding<Color>) {
        self._parameters = parameters
        self._color = color
    }

    var body: some View {
        ZStack {
            Circle()
                .frame(width: parameters.width, height: parameters.height)
                .foregroundColor(color)
                .onAppear {
                    // Set the initial position
                    self.offsetX = parameters.xOffset
                    self.offsetY = parameters.yOffset
                }

            Text(String(color.description)) // Display the first character of the color description
                .foregroundColor(.white)
                .font(.largeTitle)
        }
        .animation(Animation.easeInOut(duration: parameters.duration).repeatForever(autoreverses: true))
        .offset(x: offsetX, y: offsetY)
    }

    // Example method to perform an action on the AnimatedCircle
    func hide() {
        withAnimation {
            offsetX = 0
            offsetY = 0
        }
    }
}

struct CircleParameters: Identifiable {
    let id = UUID()
    var width: CGFloat
    var height: CGFloat
    var color: Color
    var duration: Double
    var xOffset: CGFloat
    var yOffset: CGFloat
    var isClicked: Bool
    var visible: Bool
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}










