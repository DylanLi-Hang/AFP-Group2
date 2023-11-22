//
//  JarView.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 22/11/2023.
//

import SwiftUI

struct JarView: View {

    var body: some View {
        ZStack {
            Color("purpleish").ignoresSafeArea()
            VStack {
                HStack {
                    Image(systemName: "chevron.backward")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 11.0, height: 18.0)
                        .foregroundColor(Color("blackish"))
                        .padding()
                    Spacer()
                }
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
                            
//                        Spacer()
                            .frame(height: 270)
                        Image("Jar1")
                            .resizable()
                            .scaledToFit()
                            .fixedSize()
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
