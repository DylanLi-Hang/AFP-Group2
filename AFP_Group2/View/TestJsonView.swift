//
//  TestView.swift
//  AFP_Group2
//
//  Created by Dylan on 22/11/2023.
//

import SwiftUI

import SwiftUI

struct TestJsonView: View {
    var body: some View {
        NavigationView {
            List(misconceptions, id: \.citation) { item in
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.misconception)
                        .font(.headline)
                    Text(item.quoteOrFact)
                        .font(.body)
                    if let highlight = item.highlight {
                        Text("Highlight: \(highlight)")
                            .font(.caption)
                    }
                    Text("Citation: \(item.citation)")
                        .font(.caption)
                    if let career = item.career {
                        Text("Career: \(career)")
                            .font(.caption)
                    }
                    Text("Video File: \(item.videoFileName)")
                        .font(.caption)
                }
            }
            .navigationBarTitle("Misconceptions")
        }
    }
}



#Preview {
    TestJsonView()
}
