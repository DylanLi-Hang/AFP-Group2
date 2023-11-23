//
//  JarView.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 22/11/2023.
//

import SwiftUI
import SpriteKit

struct JarView: View {
    var background: Color = .yellowish
    @State private var isStarVisible = false
    private var starScene: StarScene

    init() {
        starScene = StarScene(size: CGSize(width: 100, height: 160), backgroundColor: UIColor(background))
    }

    
    var body: some View {
        ZStack {
            background.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    VStack {
                        Text("Do you wanna add this spark to your confidence jar? ")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(Color("blackish"))
                            .multilineTextAlignment(.center)
                        Text("Drag down\nto add it")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color("blackish"))
                            .multilineTextAlignment(.center)
                            .rotationEffect(.degrees(10))
                            .offset(x: 70, y: 30)
                        Image("arrow1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .rotationEffect(.degrees(-10))
                            .offset(x: 50, y: -88)
                            
                            .frame(height: 270)
                        ZStack {
                            SpriteView(scene: starScene)
                                .frame(width: 100, height: 160)
                            Image("Jar1")
                                .resizable()
                                .scaledToFit()
                                .fixedSize()
                            
                            Button(action: {
                                starScene.addStar()
                            }) {
                                Image("SparkTransparent")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100) // Set your desired width and height
                            }
                            .offset(y: -300)
                        }
                    }
                    .frame(width: 200)
                }
                Spacer()
            }
            
        }

    }

}
struct Jar_Previews: PreviewProvider {
    static var previews: some View {
        JarView()
    }
}
