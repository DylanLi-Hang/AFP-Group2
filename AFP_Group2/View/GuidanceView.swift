//
//  GuidanceView.swift
//  AFP_Group2
//
//  Created by Jamie Chao on 21/11/2023.
//

import SwiftUI

struct GuidanceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isActive: Bool = false
    var body: some View {
        NavigationView {
            
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
                NavigationLink("", destination: GuidanceView2(), isActive: $isActive)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isActive = true
                        }
                    }
                    .hidden()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
                            leading: backButton,
                            trailing: HStack {
                                Text("Guidance").font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.blue)
                                    .multilineTextAlignment(.trailing)
                            }
                        )
    }
    
    // Custom back button
       private var backButton: some View {
           Button(action: {
               // Handle custom back button action
               presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
                   Image(systemName: "chevron.backward")
                       .resizable(resizingMode: .stretch)
                       .frame(width: 11.0, height: 18.0)
                       .foregroundColor(Color.blue)
               }
               .foregroundColor(.white)
           }
       }
}




struct GuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidanceView()
    }
}
