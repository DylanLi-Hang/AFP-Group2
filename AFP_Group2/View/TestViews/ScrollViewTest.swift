//
//  ScrollViewTest.swift
//  AFP_Group2
//
//  Created by Dylan on 2/3/2024.
//

import SwiftUI

struct ScrollViewTest: View {
    
    @State private var scrollID: Int?
    
    let bgColors: [Color] = [ .yellow, .blue, .orange, .indigo, .green ]
 
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0...50, id: \.self) { index in
 
                    bgColors[index % 5]
                        .frame(height: 100)
                        .overlay {
                            Text("\(index)")
                                .foregroundStyle(.white)
                                .font(.system(.title, weight: .bold))
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollID)
        .contentMargins(.horizontal, 10.0, for: .scrollContent)
        .onChange(of: scrollID) { oldValue, newValue in
            print(newValue ?? "")
        }
        
 
    }
}

#Preview {
    ScrollViewTest()
}
