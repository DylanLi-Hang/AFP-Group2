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
    let starScene = StarScene(size: CGSize(width: 100, height: 300), backgroundColor: UIColor(.darkPurpleish), star_color: "SparkLatest")
    
    var body: some View {
        ZStack {
//            background.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    ZStack{
                        ZStack {
                            SpriteView(scene: starScene)
                                .frame(width: 100, height: 400)
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
                            Text("Tap to\n add it")
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
//        ZStack {
//            SpriteView(scene: starScene)
//                .frame(width: 100, height: 300)
//                .offset(y: 50)
//            
//            BottleView(isHighlighted: false)
//                .offset(y:120)
//            
//            Button(action: {
//                starScene.addStar() // Call addStar() method here
//            }) {
//                Text("Drop Star")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .offset(y: -100)
//        }
}

#Preview {
    CollectStarView()
}
