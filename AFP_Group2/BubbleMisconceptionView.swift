//
//  BubbleIntersection.swift
//  AFP_Group2
//
//  Created by Fabian Roth on 20/11/2023.
//
import SwiftUI
import CoreMotion
import SwiftData


let renderHeight =  (UIScreen.main.bounds.height)*2
let renderWidth = UIScreen.main.bounds.width


struct BubbleMisconceptionView: View {
    private let motionManager = CMMotionManager()
    @State var stateManager = StateManager()
    @State private var isExploded = false
    private let explodingBits: Int = 75
    @State private var smashState = false
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activateLink = false
    @State private var speed = CGFloat(1)
    @State private var timer: Timer?;
    
    @State private var misconceptionSelected: MisconceptionModel = misconceptions[0]
    
    @State private var bubbles: [Bubble] = []
    //@EnvironmentObject var bubbleData: BubbleData

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
                    }, label: {
                        ZStack {
                            if smashState{
                                ForEach(0..<explodingBits, id: \.self) { _ in
                                    Circle()
                                        .rotation(Angle(degrees: Double.random(in: 0..<360)))
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color(bubble.color))
                                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                                        .opacity(isExploded ? 0 : 1)
                                        .animation(.easeInOut.speed(0.6), value: isExploded)
                                        .padding()
                                }
                            }
                            Circle()
                                .fill(Color(bubble.color))
                                .frame(width: isExploded ? bubble.radius * 10 : bubble.radius * 2, height: isExploded ? bubble.radius * 10 : bubble.radius * 2)
                                .opacity(isExploded ? 0 : (bubble.isPopped ? 0.5 : 1))
                                .animation(.easeInOut.speed(0.6), value: isExploded)
                                
                            VStack(alignment: .center, spacing: 0){
                                        Spacer()
                                        Text(bubble.text)
                                            .font(.title2)                                            
                                            .fixedSize(horizontal: false, vertical: true)
                                        Spacer()
                                    }
                            .frame(width: bubble.radius * 2 * 0.7, height: bubble.radius * 2 * 0.7)
                        }
                        .opacity(bubble.visible ? 1 : 0)
                        .gesture(
                            DragGesture(minimumDistance: 1)
                            .onChanged { _ in
                                if smashState{
                                    withAnimation {
                                        isExploded.toggle()
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        activateLink = true
                                    }
                                }
                                if isExploded {
                                    // The view is disappearing after the explosion animation
                                    stateManager.current = .profile
                                    misconceptions[index].state = true
                                }
                            }
                        )
                        .onTapGesture {
                            print("Button Pressed")
                            misconceptionSelected = misconceptions[index]
                            // Set visibility to false for all bubbles except the tapped one
                            for i in bubbles.indices {
                                bubbles[i].visible = (bubbles[i] == bubble)
                            }
                            // Smash State
                            if bubble.radius < 150{
                                smashState.toggle()
                            }
                            
                            // Change Size
                            let centerY = geometry.frame(in: .global).midY
                            handleClick(for: index, with: centerY)
                            
                            misconceptionSelected = misconceptions[index]
                            
                            print("SMAAAAASH IT")
                            print("Activate Link >>: \(activateLink)")
                            print("Smash State >>: \(smashState)")
                            print("Is Exploded >>:\(isExploded)")
                            print("Bubble Count : >> \(bubbles.count)")
                        }
                    })
                    .foregroundColor(.white)
                    .position(bubble.position)
                }
                
            }
            .frame(width: renderWidth, height: smashState ? renderHeight/2 : renderHeight)
            NavigationLink(destination: VideoSwipingView(misconception: misconceptionSelected), isActive: $activateLink) {
                EmptyView()
                            }
                            .hidden()
                            .id(activateLink) // Add id for triggering the transition
                            .transition(.opacity) // Apply the opacity transition
        }
        .navigationBarBackButtonHidden(true)
        .background(.white)    
        .onAppear {
            // (Re)create Bubble Array
            startMotionManager()
            timer?.invalidate()
            recreateBubblesArray();
            speed = CGFloat(1)
            timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
                withAnimation {
                    if !smashState{
                        updateBubblesPositions(in: CGRect(x: 0, y: 0, width: renderWidth, height: renderHeight))
                    }
                        
                }
                
                
            }
            if let timer = timer {
                RunLoop.main.add(timer, forMode: .common)
            }
        }
        .onDisappear {
                    timer?.invalidate()
        }
    }

    private func randomPosition(in bounds: CGRect) -> CGPoint {
        return CGPoint(x: CGFloat.random(in: 0...(bounds.width - 100)), y: CGFloat.random(in: 0...(bounds.height - 100)))
    }

    private func randomVelocity() -> CGVector {
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
                    if bubbles[index].radius < 150{
                        bubbles[index].radius *= 1.4
                        
                        // Move the clicked circle to the center of the screen
                        let centerX = renderWidth / 2
                        let centerY = renderHeight / 4
                        bubbles[index].position.x = centerX
                        bubbles[index].position.y = centerY
                        
                    }
                }
            }
        }
    }
    
    private func recreateBubblesArray() {
            isExploded = false
            activateLink = false
            smashState = false
            bubbles = []

            for index in 0..<misconceptions.count {
                let item = misconceptions[index]

                bubbles.append(Bubble(
                    radius: 120,
                    position: randomPosition(in: CGRect(x: 0, y: 0, width: renderWidth, height: renderHeight)),
                    velocity: randomVelocity(),
                    color: UIColor[item.bubbleColor],
                    text: item.misconception,
                    visible: true,
                    isPopped: item.state
                ))
            }
            //print("Bubbles Array : >> \(bubbles)")
            print("Activate Link >>: \(activateLink)")
            print("Smash State >>: \(smashState)")
            print("Is Exploded >>:\(isExploded)")
            print("Bubble Count : >> \(bubbles.count)")
        }
    
    private func startMotionManager() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(to: .main) { (data, error) in
                guard let acceleration = data?.userAcceleration else { return }

                let accelerationThreshold: Double = 2.0
                if acceleration.x > accelerationThreshold || acceleration.y > accelerationThreshold || acceleration.z > accelerationThreshold {
                    withAnimation {
                        //------------------------
                        misconceptionSelected.state = true
                        isExploded.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                activateLink.toggle()
                                            }
                    }
                }
            }
        }
    }
    
    private func stopMotionManager() {
        motionManager.stopDeviceMotionUpdates()
    }
}

struct Bubble: Equatable {
    var radius: CGFloat = 200.0
    var position: CGPoint
    var velocity: CGVector
    var color: UIColor
    var text: String
    var visible: Bool
    var isPopped: Bool
}

extension Bubble {
    static func == (lhs: Bubble, rhs: Bubble) -> Bool {
        return lhs.radius == rhs.radius &&
               lhs.position == rhs.position &&
               lhs.velocity == rhs.velocity &&
               lhs.color == rhs.color &&
               lhs.text == rhs.text &&
               lhs.isPopped == rhs.isPopped &&
               lhs.visible == rhs.visible
               
    }
}

extension CGVector {
    func length() -> CGFloat {
        return sqrt(dx * dx + dy * dy)
    }
}

#Preview {
    let container = try! ModelContainer(for: MisconceptionModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let context = container.mainContext

    let model = MisconceptionModel(misconception: "", quoteOrFact: "", highlight: "", citation: "", career: "", videoFileName: "", bubbleColor: "", backgroundColor: "", highlightColor: "", backgroundTextColor: "", highlightTextColor: "", videoURL: "", state: true)
        context.insert(model)
        try! context.save()

        return BubbleMisconceptionView(stateManager: StateManager())
            .modelContainer(container)
}




@Observable
class StateManager {
    
    enum screen {
        case home
        case bubbleView
        case profile
    }
    
    var current: screen = screen.home

}

class YourScrollViewDelegate: NSObject, UIScrollViewDelegate {
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        // Return true to enable scrolling to the top
        return true
    }
}


