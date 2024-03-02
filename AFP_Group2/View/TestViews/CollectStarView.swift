//
//  CollectStarView.swift
//  AFP_Group2
//
//  Created by Dylan on 20/11/2023.
//

import SwiftUI
import SpriteKit

struct CollectStarView: View {
    @State private var isStarVisible = false
    let starScene = StarScene(size: CGSize(width: 100, height: 300), backgroundColor: .white, star_color: "SparkLatest")
    
    var body: some View {
        ZStack {
            SpriteView(scene: starScene)
                .frame(width: 100, height: 300)
                .offset(y: 50)
            
            BottleView(isHighlighted: false)
                .offset(y:120)
            
            Button(action: {
                starScene.addStar() // Call addStar() method here
            }) {
                Text("Drop Star")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .offset(y: -100)
        }
    }
}

class StarScene: SKScene {
    var sceneBackgroundColor: UIColor
    var star_color:String = "SparkColorLatest"
    
    init(size: CGSize, backgroundColor: UIColor, star_color: String) {
        self.sceneBackgroundColor = backgroundColor
        super.init(size: size)
        self.star_color = star_color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        view.allowsTransparency = true
        backgroundColor = sceneBackgroundColor
        physicsWorld.gravity = CGVector(dx: 0, dy: -1.2)
        
        for i in 0..<10 {
            let delay = SKAction.wait(forDuration: 0.1 * Double(i))
            run(delay) { [weak self] in
                self?.addRandomStar()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let star = createStar(at: location)
        addChild(star)
    }
    
    func addStar() {
        let star = createStar(at: CGPoint(x: size.width/2, y: size.height-10))
        addChild(star)
    }
    
    func addRandomStar() {
        let xPosition = CGFloat.random(in: 40...size.width-40)
        let yPosition = CGFloat.random(in: 10...size.height-20)
        let star = createStar(at: CGPoint(x: xPosition, y: yPosition))
        addChild(star)
    }
    
    func createStar1(at position: CGPoint) -> SKShapeNode {
        let starPath = createStarPath()

        let star = SKShapeNode(path: starPath)
        star.position = position
        star.fillColor = .systemYellow
        star.strokeColor = .clear
        star.physicsBody = SKPhysicsBody(polygonFrom: starPath)

        return star
    }
    
    func createStar(at position: CGPoint) -> SKSpriteNode {
        
        let starTexture = SKTexture(imageNamed: star_color)
        let star = SKSpriteNode(texture: starTexture)
        star.position = position
        star.size = CGSize(width: 30, height: 30)
        
        let starPath = createStarPath()
        star.physicsBody = SKPhysicsBody(polygonFrom: starPath)

        return star
    }

    func createStarPoints(center: CGPoint, points: Int, radius: CGFloat, adjustment: CGFloat) -> [CGPoint] {
        var result = [CGPoint]()
        let angleIncrement = CGFloat.pi * 2.0 / CGFloat(points)
        let innerRadius = radius * adjustment

        for point in 0..<points {
            let angle = CGFloat(point) * angleIncrement
            let outerPoint = CGPoint(x: radius * cos(angle) + center.x, y: radius * sin(angle) + center.y)
            let innerAngle = angle + angleIncrement / 2.0
            let innerPoint = CGPoint(x: innerRadius * cos(innerAngle) + center.x, y: innerRadius * sin(innerAngle) + center.y)

            result.append(outerPoint)
            result.append(innerPoint)
        }

        return result
    }
    
    func createStarPath() -> CGMutablePath {
        let starPath = CGMutablePath()
        let starPoints = createStarPoints(center: CGPoint.zero, points: 5, radius: 15, adjustment: 0.5)
        starPath.addLines(between: starPoints)
        starPath.closeSubpath()
        return starPath
    }
}

#Preview {
    CollectStarView()
}
