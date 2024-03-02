//
//  QuoteView.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 20/11/2023.
//

import SwiftUI

struct QuoteView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Color("redish").ignoresSafeArea()
            VStack {
                Spacer()
                Text(attributedString(text: "text", highlighted: "tex", backgroundColor: .yellow, foregroundColor: .red))
                        .font(.title)
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "bookmark")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 24.0, height: 39.0)
                            .foregroundColor(Color.white)
                        Spacer()
                            .frame(height: 15)
                        Image(systemName: "square.and.arrow.up")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 24.0, height: 30.52)
                            .foregroundColor(Color.white)
                        Spacer()
                            .frame(height: 15)
                    }
                }
                .padding([.bottom, .trailing])
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
                            leading: backButton,
                            trailing: HStack {
                                Text("Misconceptions").font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.trailing)
                            }
                        )
        .accentColor(Color.black)
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
                       .foregroundColor(Color.white)
               }
               .foregroundColor(.white)
           }
       }
}


struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide sample data for previews
        QuoteView()
    }
}
