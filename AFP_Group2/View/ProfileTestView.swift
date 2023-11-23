//
//  ProfileTestView.swift
//  AFP_Group2
//
//  Created by Dylan on 23/11/2023.
//

import SwiftUI

struct ProfileTestView: View {
    var body: some View {
        VStack {
            Spacer()
            .frame(height: 30)
            HStack {
                VStack(alignment: .leading) {
                    Text("Catalina Myers")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("blackish"))
                    Text("18 years old")
                        .foregroundColor(Color("blackish"))
                    Image("flag")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                }
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                Spacer()
                Image("picture")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
          }
            Spacer()
            .frame(height: 60)
            HStack {
                Text("Confidence jar")
                    .foregroundColor(Color("blackish"))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Spacer()
            .frame(height: 15)
            VStack {
                Image("jar-spark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            }
            .frame(width: 355, height:310)
            .background(Color("greyish"))
            .cornerRadius(20)
            Text("9 Sparks")
                .fontWeight(.bold)
                .padding(.horizontal, 11)
                .padding(.vertical, 7)
                .background(Color("dark-purpleish"))
                .foregroundColor(Color.white)
                .cornerRadius(20)
                .offset(x: 110, y: -335)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileTestView()
}
