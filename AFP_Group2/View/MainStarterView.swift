//
//  MainStarterView.swift
//  AFP_Group2
//
//  Created by Dylan on 23/11/2023.
//

import SwiftUI

struct MainStarterView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                GuidanceView() // Replace with your main view
            } else {
                StartView() // Your custom splash screen view
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
