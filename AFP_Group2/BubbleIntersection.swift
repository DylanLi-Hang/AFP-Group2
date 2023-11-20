//
//  BubbleIntersection.swift
//  AFP_Group2
//
//  Created by Fabian Roth on 20/11/2023.
//
import SwiftUI

let renderHeight =  (UIScreen.main.bounds.height) * 2
let renderWidth = UIScreen.main.bounds.width



struct BubbleIntersectionView: View {
    
    @State var stateManager = StateManager()
    @State private var isExploded = false
    private let explodingBits: Int = 75
    @State private var smashState = false
//    private let motionManager = CMMotionManager()
    
    @State private var bubbles: [Bubble] = []
    private var people = ["wesley", "person", "AJ", "lauren", "fabian", "someone"]
    private var colors: [Color] = [Color.red, Color.orange, Color.yellow, Color.green, Color.cyan, Color.blue, Color.purple, Color.pink, Color.red]
    
    init(stateManager: StateManager) {
        self.stateManager = stateManager
    }
    
    var body: some View {
        ScrollView ([.horizontal, .vertical], showsIndicators: false) {
            GeometryReader { geometry in
                ForEach(bubbles.indices, id: \.self) { index in
                    let bubble = bubbles[index]
                    Button(action: {
                        stateManager.current = .bubbleView
//                        stateManager.bubble = bubble
                    }, label: {
                        ZStack {
                            ForEach(0..<explodingBits, id: \.self) { _ in
                                Circle()
                                    .rotation(Angle(degrees: Double.random(in: 0..<360)))
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(bubble.color)
                                    .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                                    .opacity(isExploded ? 0 : 1)
                                    .animation(.easeInOut.speed(0.6), value: isExploded)
                                    .padding()
                            }
                            Circle()
                                .fill(bubble.color)
                                .frame(width: isExploded ? bubble.radius * 10 : bubble.radius * 2, height: isExploded ? bubble.radius * 10 : bubble.radius * 2)
                                .opacity(isExploded ? 0 : 1)
                                .animation(.easeInOut.speed(0.6), value: isExploded)
                                .gesture(
                                    DragGesture()
                                        .onChanged { _ in
                                            withAnimation {
                                                isExploded.toggle()
                                            }
                                        }
                                )
                                .onTapGesture {
                                    print("Button Pressed")
                                    // Set visibility to false for all bubbles except the tapped one
                                        for i in bubbles.indices {
                                            bubbles[i].visible = (bubbles[i] == bubble)
                                        }
                                    // Smash State
                                    smashState.toggle()
                                    
                                    // Change Size
                                    let centerY = geometry.frame(in: .local).midY
                                    handleClick(for: index, with: centerY)
                                }
                            VStack {
                                Image(systemName: "person")
                                Text(bubble.text)
                            }
                        }
                        .opacity(bubble.visible ? 1 : 0)
                    })
                        .foregroundColor(.white)
                        .position(bubble.position)
                }
            }
            .frame(width: renderWidth, height: renderHeight)
        }
        .background(.white)

    
        .onAppear {
            bubbles = []
            // Include the sissconception array in here
            var index = 0
            for i in 0..<12 {
                index = (index == 7) ? 0 : index + 1;
                bubbles.append(Bubble(radius: 100, position: randomPosition(in: CGRect(x: 0, y: 0, width: renderWidth, height: renderHeight)), velocity: randomVelocity(), color: colors[index],text: people[i % 6], visible: true))
            }
            
            let timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                withAnimation {
                    if !smashState{
                        updateBubblesPositions(in: CGRect(x: 0, y: 0, width: renderWidth, height: renderHeight))
                    }
                        
                }
            }
            RunLoop.main.add(timer, forMode: .common)
        }
    }

    private func randomPosition(in bounds: CGRect) -> CGPoint {
        return CGPoint(x: CGFloat.random(in: 0...(bounds.width - 50)), y: CGFloat.random(in: 0...(bounds.height - 50)))
    }

    private func randomVelocity() -> CGVector {
        let speed = CGFloat(1.5)
        let angle = CGFloat.random(in: 0...(2 * .pi))
        return CGVector(dx: cos(angle) * speed, dy: sin(angle) * speed)
    }

    private func updateBubblesPositions(in bounds: CGRect) {
        for index in bubbles.indices {
            var bubble = bubbles[index]
            bubble.position.x += bubble.velocity.dx
            bubble.position.y += bubble.velocity.dy

            if bubble.position.x < 0 || bubble.position.x > bounds.width {
                bubble.velocity.dx *= -1
            }

            if bubble.position.y < 0 || bubble.position.y > bounds.height {
                bubble.velocity.dy *= -1
            }

            for otherIndex in bubbles.indices where otherIndex != index {
                var otherBubble = bubbles[otherIndex]
                let distance = hypot(bubble.position.x - otherBubble.position.x, bubble.position.y - otherBubble.position.y)

                if distance < bubble.radius + otherBubble.radius {
                    handleCollision(bubble: &bubble, with: &otherBubble)
                    bubbles[otherIndex] = otherBubble
                }
            }

            for otherIndex in bubbles.indices where otherIndex != index {
                var otherBubble = bubbles[otherIndex]
                let distance = hypot(bubble.position.x - otherBubble.position.x, bubble.position.y - otherBubble.position.y)

                let minDistance = bubble.radius + otherBubble.radius
                if distance < minDistance {
                    let overlap = minDistance - distance
                    let direction = CGVector(dx: otherBubble.position.x - bubble.position.x, dy: otherBubble.position.y - bubble.position.y)
                    let unitDirection = CGVector(dx: direction.dx / distance, dy: direction.dy / distance)

                    bubble.position.x -= overlap * 0.5 * unitDirection.dx
                    bubble.position.y -= overlap * 0.5 * unitDirection.dy

                    otherBubble.position.x += overlap * 0.5 * unitDirection.dx
                    otherBubble.position.y += overlap * 0.5 * unitDirection.dy

                    bubbles[otherIndex] = otherBubble
                }
            }
            bubbles[index] = bubble
        }
    }

    private func handleCollision(bubble: inout Bubble, with otherBubble: inout Bubble) {
        let relativeVelocity = CGVector(dx: bubble.velocity.dx - otherBubble.velocity.dx, dy: bubble.velocity.dy - otherBubble.velocity.dy)
        let normal = CGVector(dx: otherBubble.position.x - bubble.position.x, dy: otherBubble.position.y - bubble.position.y)
        let distance = hypot(normal.dx, normal.dy)
        let unitNormal = CGVector(dx: normal.dx / distance, dy: normal.dy / distance)

        let relativeSpeed = relativeVelocity.dx * unitNormal.dx + relativeVelocity.dy * unitNormal.dy

        let impulse = 2 * relativeSpeed / (bubble.radius + otherBubble.radius)

        bubble.velocity.dx -= impulse * otherBubble.radius * unitNormal.dx
        bubble.velocity.dy -= impulse * otherBubble.radius * unitNormal.dy

        otherBubble.velocity.dx += impulse * bubble.radius * unitNormal.dx
        otherBubble.velocity.dy += impulse * bubble.radius * unitNormal.dy

        let maxVelocityChange: CGFloat = 5.0
        bubble.velocity.dx = max(-maxVelocityChange, min(maxVelocityChange, bubble.velocity.dx))
        bubble.velocity.dy = max(-maxVelocityChange, min(maxVelocityChange, bubble.velocity.dy))

        otherBubble.velocity.dx = max(-maxVelocityChange, min(maxVelocityChange, otherBubble.velocity.dx))
        otherBubble.velocity.dy = max(-maxVelocityChange, min(maxVelocityChange, otherBubble.velocity.dy))
    }
    
    private func handleClick(for tappedIndex: Int, with centerY: CGFloat) {
        withAnimation(.easeInOut(duration: 1.5)) {
            bubbles.indices.forEach { index in
                if index == tappedIndex {
                // Expand the clicked circle
                    bubbles[index].radius *= 1.7
                    
                // Move the clicked circle to the center of the screen
                let centerX = renderWidth / 2
                let centerY = centerY
                bubbles[index].position = CGPoint(x: centerX, y: centerY)
                }
            }
        }
    }
}

struct Bubble: Equatable {
    var radius: CGFloat = 200.0
    var position: CGPoint
    var velocity: CGVector
    var color: Color
    var text: String
    var visible: Bool
}

extension Bubble {
    static func == (lhs: Bubble, rhs: Bubble) -> Bool {
        return lhs.radius == rhs.radius &&
               lhs.position == rhs.position &&
               lhs.velocity == rhs.velocity &&
               lhs.color == rhs.color &&
               lhs.text == rhs.text &&
               lhs.visible == rhs.visible
    }
}

extension CGVector {
    func length() -> CGFloat {
        return sqrt(dx * dx + dy * dy)
    }
}

#Preview {
    BubbleIntersectionView(stateManager: StateManager())
}




@Observable
class StateManager {
    
    enum screen {
        case home
        case bubbleView
    }
    
//    var bubble = Bubble(radius: 100, position: CGPoint() , velocity: CGVector(dx:1, dy:1), color: .black, text: "error", visible: true)
    
    var current: screen = screen.home

}
