//
//  SwiftUIView.swift
//  AFP_Group2
//
//  Created by Jamie Chao on 22/11/2023.
//

import SwiftUI

struct OverlayTestView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct OverlayView: View {
    @State private var isActive: Bool = false
    var body: some View {
        NavigationView {
            
            ZStack {
                
                // The overlay with blur effect
                OverlayTestView(style: .systemMaterialDark)
                    .edgesIgnoringSafeArea(.all) 
                // Ensures the blur goes edge-to-edge
                
                // Any other views you want on top of the blur
                Text("Future BubbleView")
                    .foregroundColor(.white)
                    .font(.title)
                
                NavigationLink("", destination: GuidanceView(), isActive: $isActive)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isActive = true
                        }
                    }
                    .hidden()
            }
        }
    }
}
//    private func delayText() {
//        // Delay of 7.5 seconds
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            hasTimeElapsed = true
//        }
        
  //  }

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
    }
}


