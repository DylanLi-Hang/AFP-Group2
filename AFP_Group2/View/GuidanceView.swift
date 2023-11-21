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
                
                Text("Choose your concern")
                    .font(.title)
                    .padding(.bottom, 50)
                
                Circle()
                    .fill(Color.yellow.opacity(0.3))
                    .frame(width: 200, height: 200)
                    .overlay(
                    Text("I'm not good at coding")
                        .font(.caption.bold())
                    .foregroundColor(.black)
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

#Preview {
    GuidanceView()
}
