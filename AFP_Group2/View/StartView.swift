//
//  StartView.swift
//  AFP_Group2
//
//  Created by Dylan on 23/11/2023.
//

import SwiftUI
import SpriteKit

struct StartView: View {
    var body: some View {
        
        VStack{
            ZStack {
                VStack{
                    let starScene = StarScene(size: CGSize(width: 400, height: 600), backgroundColor: UIColor(.startBg), star_color: "SparkLatest")
                    SpriteView(scene: starScene)
                        .frame(width: 400, height: 600)
                        .offset(y:120)
                }
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(80)
                    .offset(y:-100)
                Spacer()
                    .frame(height: 20)

                
            }
            
//            LottieView(name: "loading", loopMode: .loop)
//                .frame(width: 100, height: 100)
//                .padding(.bottom, 20)
//                .offset(y: -100)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.startBg)
    }
}

#Preview {
    StartView()
}
