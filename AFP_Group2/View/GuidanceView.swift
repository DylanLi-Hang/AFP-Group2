//
//  GuidanceView.swift
//  AFP_Group2
//
//  Created by Jamie Chao on 21/11/2023.
//

import SwiftUI

struct GuidanceView: View {
    var body: some View {
        ZStack {
            
            // Background color
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            // Overlayed focused yellow circle and text
            VStack {
                Spacer()
                
                Text("Choose a stereotype")
                    .font(.title)
                    .padding(.bottom, 50)
                
                Circle()
                    .fill(Color.yellow.opacity(0.3))
                    .frame(width: 200, height: 200)
                    .overlay(
                    Text("Women are not good at coding")
                        .font(.headline.bold())
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 100, height: 100, alignment: .center)
                    )
                    .padding(.bottom, 50)
                                
                // Hand Icon
                LottieView(name: "tap", loopMode: .loop)
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 20)
                    .offset(y: -100)
                
                Spacer()
                
            }
            
        }
    }
}

struct GuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidanceView()
    }
}
