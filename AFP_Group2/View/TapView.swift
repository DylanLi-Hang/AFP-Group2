//
//  TapView.swift
//  AFP_Group2
//
//  Created by Dylan on 20/11/2023.
//

import SwiftUI
import Lottie

struct TapView: View {
    var body: some View {
        LottieView(name: "tap", loopMode: .loop)
            .frame(width: 100, height: 100, alignment: .center)
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}
