//
//  GuidanceView2.swift
//  AFP_Group2
//
//  Created by Jamie Chao on 21/11/2023.
//

import SwiftUI

struct GuidanceView2: View {
    var body: some View {
        ZStack {
            
            // Background color
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            // Overlayed focused yellow circle and text
            VStack {
                
                Spacer()
                
                Circle()
                    .fill(Color.yellow.opacity(0.3))
                    .frame(width: 280, height: 280)
                    .overlay(
                    Text("Women are not good at coding")
                        .font(.title2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 150, height: 200, alignment: .center)
                    )
                    .padding(.bottom, 50)
                
                Spacer()
                
            }
        }
    }
}

struct GuidanceView2_Previews: PreviewProvider {
    static var previews: some View {
        GuidanceView2()
    }
}
