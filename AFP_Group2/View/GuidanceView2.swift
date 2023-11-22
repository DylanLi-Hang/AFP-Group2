//
//  GuidanceView2.swift
//  AFP_Group2
//
//  Created by Jamie Chao on 21/11/2023.
//

import SwiftUI

struct GuidanceView2: View {
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
                    
                    HStack {
                        
                        VStack {
                            LottieView(name: "shake", loopMode: .loop)
                                .frame(width: 150, height: 150, alignment: .center)
                            Text("Shake")
                                .font(.title)
                        }
                        .padding(.bottom, 50)
                        
                        VStack {
                            
                            LottieView(name: "slice", loopMode: .loop)
                                .frame(width: 150, height: 150, alignment: .center)
                            
                            Text("or slice")
                                .font(.title)
                        }
                        .padding(.bottom, 50)
                    }
                    
                }
                NavigationLink("", destination: ContentView(), isActive: $isActive)
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

struct GuidanceView2_Previews: PreviewProvider {
    static var previews: some View {
        GuidanceView2()
    }
}
