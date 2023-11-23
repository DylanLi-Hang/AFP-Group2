//
//  JarView.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 22/11/2023.
//

import SwiftUI
import SpriteKit

struct JarView: View {
    var background: Color = .sparkBackground
    @State private var isStarVisible = false
    private var starScene: StarScene

    init() {
        starScene = StarScene(size: CGSize(width: 100, height: 400), backgroundColor: UIColor(background))
    }

    
    var body: some View {
        ZStack {
            background.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    ZStack{
                        ZStack {
                            SpriteView(scene: starScene)
                                .frame(width: 100, height: 380)
                                .offset(y:-120)
                            Image("Jar1")
                                .resizable()
                                .scaledToFit()
                                .fixedSize()
                            
                            Button(action: {
                                starScene.addStar()
                            }) {
                                Image("SparkLatest")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100) // Set your desired width and height
                            }
                            .offset(y: -300)
                        }
                        .offset(y: 200)
                        
                        VStack {
                            Text("Do you wanna add this spark to your confidence jar? ")
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(Color("SparkText"))
                                .multilineTextAlignment(.center)
                                .offset(y: -100)
                            Text("Click\nto add it")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color("SparkText"))
                                .multilineTextAlignment(.center)
                                .rotationEffect(.degrees(10))
                                .offset(x: 100, y: -60)
                            Image("arrow1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .rotationEffect(.degrees(-10))
                                .offset(x: 80, y: -180)
                                .frame(height: 270)
                            
                        }
                        .frame(width: 200)
                        
                    }
                    
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
