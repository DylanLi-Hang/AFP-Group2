//
//  SavedView.swift
//  AFP_Group2
//
//  Created by Jamie Chao on 23/11/2023.
//

import SwiftUI

struct SavedScreenView: View {
    
    // Assuming you have an array of image names or UIImage objects
    let images: [String] = ["VideoImage1", "VideoImage2", "VideoImage3", "Quote1", "Quote2", "Quote3", "VideoImage4", "VideoImage5", "VideoImage6"]

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(images, id: \.self) { imageName in
                        Image(imageName) // Use your own image assets
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Saved content", displayMode: .large)
        }
    }
}

struct SavedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SavedScreenView()
    }
}

