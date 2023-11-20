//
//  TestView.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 20/11/2023.
//

//
import SwiftUI

struct IconsView: View {
    var body: some View {
    VStack {
    
        Text(verbatim: "Video/Quote")
        Image(systemName: "bookmark")
            .resizable(resizingMode: .stretch)
            .frame(width: 24.0, height: 39.0)
            .foregroundColor(Color("blackish"))
            
        Image(systemName: "bookmark.fill")
            .resizable(resizingMode: .stretch)
            .frame(width: 24.0, height: 39.0)
            .foregroundColor(Color("redish"))
            
        Image(systemName: "square.and.arrow.up")
            .resizable(resizingMode: .stretch)
            .frame(width: 24.0, height: 30.52)
            .foregroundColor(Color("blackish"))
        
        Image(systemName: "play.circle")
            .resizable(resizingMode: .stretch)
            .frame(width: 79, height: 79)
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
         
        Image(systemName: "chevron.backward")
            .resizable(resizingMode: .stretch)
            .frame(width: 11.0, height: 18.0)
            .foregroundColor(Color("blackish"))

        
        Text(verbatim: "Nav bar")
        Image(systemName: "circle.hexagongrid.fill")
            .resizable(resizingMode: .stretch)
            .frame(width: 22, height: 22)
            .foregroundColor(Color("blackish"))
        
        Image(systemName: "bookmark")
            .resizable(resizingMode: .stretch)
            .frame(width: 14.18, height: 22)
            .foregroundColor(Color("blackish"))
        
        Image(systemName: "person")
            .resizable(resizingMode: .stretch)
            .frame(width: 20.75, height: 22)
            .foregroundColor(Color("blackish"))
        
        }
    .background(Color.red)
    }
    
    
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}
